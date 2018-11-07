# Pendo NPS - Visualized with Looker

The Block was built using representative components to pull data from Pendo (Xplenty and the Pendo public API), transform it as necessary (ex. convert dates from epoch to human-readable, apply a hash to PII data like visitorId), load it into a data warehouse / repository (in this case, Snowflake), and visualize it via Looker.

Following are the step-by-step implementation instructions for implementing this Block:  

Prerequisite:  The data extraction step leverages the Pendo public API.  This can be found by logging into your Pendo UI and navigating to Settings (lower left corner) -> Integrations -> Integration Keys.  If Integration Keys is greyed-out, please contact your Pendo CSM to inquire about pricing and activation the Pendo Integration API  package.

## Step 1 - Constructing the Pendo API call:

To get started and ensure your API call will work as expected, open your favorite RESTful API client to build the API call that will pull the NPS data for your currently active NPS poll.

```
Type = Post
URL = https://app.pendo.io/api/v1/aggregation
Headers: 
X-Pendo-Integration-Key = <your Pendo Integration API Key>
Content-Type = application/json
```

To run the below API call, you'll  need the `guideId` for the NPS poll.  This can be obtained via the Pendo UI by navigating to Guides -> click on the link to the Guide in the `Name` column -> copy guideId from the URL - Ex. the bolded portion of the following URL: 

`https://app.pendo.io/net-promoter-system/guides/`**qlONt_EWU0g5bMvCagtCdd05Xas**`/polls/9ctsdjy0ba4?view=settings`

In the request body, copy and paste the following, being sure to replace `<paste guideId here>` with the guideId from the above step:

```
{
    "response": {},
    "request": {
        "name": "pollIds",
        "pipeline": [
            {
                "source": {
                    "guides": null
                }
            },
            {
                "filter": "id==`<paste guideId here>`"
            },
            {
                "select": {
                    "pollId1": "polls[0].id",
                    "pollId2": "polls[1].id"
                }
            }
        ],
        "requestId": "pollIds"
    }
}
```

NPS Polls are considered two separate polls in the Pendo backend.  When you ran the above API call, you should have gotten a response that contained `pollId1` and `pollId2`; one respresents the quantitative responses (0-10) and the for the qualitative responses (I like Pendo because...).  

Next, we'll make another API call that incorporates these poll IDs so we can get the complete data set for the currently active NPS guide.

Finally, we'll need today's date and time in epoch time.  You can use [this handy epoch converter](https://www.epochconverter.com/) to get that value.

Using the same Type, URL and Headers above, create another API call using the below request body:

```
{
    "response": {
    "mimeType": "application/json"
  },
	"request": {
        "name": "NPSResponses",
    "pipeline": [
        {
            "source": {
                "pollEvents": {
                    "guideId": "<paste guideId here>",
                    "pollId": "<paste pollId1 here>"
                },
                "timeSeries": {
                     "period": "dayRange",
                     "first": <paste epoch time for today in this format 1485907200000 here>,
                     "count": 365
                }
            }
        },
        {
            "identified": "visitorId"
        },
        {
            "merge": {
                "fields": [
                    "visitorId",
                    "browserTime"
                ],
                "mappings": {
                    "followUpResponse": "followUpResponse"
                },
                "pipeline": [
                    {
                        "source": {
                            "pollEvents": {
                                "guideId": "<paste guideId here>",
                                "pollId": "<paste pollId1 here>"
                            },
                            "timeSeries": {
                                "period": "dayRange",
                                "first": <paste epoch time for today in this format 1485907200000 here>,
                                "count": 365
                            }
                        }
                    },
                    {
                        "identified": "visitorId"
                    },
                    {
                        "merge": {
                            "fields": [
                                "visitorId"
                            ],
                            "mappings": {
                                "followUpResponses": "responses"
                            },
                            "pipeline": [
                                {
                                    "source": {
                                        "pollEvents": {
                                            "guideId": "<paste guideId here>",
                                            "pollId": "<paste pollId2 here>"
                                        },
                                        "timeSeries": {
                                            "period": "dayRange",
                                            "first": <paste epoch time for today in this format 1485907200000 here>,
                                            "count": 365
                                        }
                                    }
                                },
                                {
                                    "identified": "visitorId"
                                },
                                {
                                    "sort": [
                                        "browserTime"
                                    ]
                                },
                                {
                                    "eval": {
                                        "responseObj.pollResponse": "pollResponse",
                                        "responseObj.browserTime": "browserTime"
                                    }
                                },
                                {
                                    "group": {
                                        "group": [
                                            "visitorId",
                                            "accountId"
                                        ],
                                        "fields": [
                                            {
                                                "responses": {
                                                    "list": "responseObj"
                                                }
                                            }
                                        ]
                                    }
                                }
                            ]
                        }
                    },
                    {
                        "unwind": {
                            "field": "followUpResponses"
                        }
                    },
                    {
                        "filter": "followUpResponses.browserTime >= (browserTime - 100) && followUpResponses.browserTime < (browserTime + 100)"
                    },
                    {
                        "group": {
                            "group": [
                                "visitorId",
                                "accountId",
                                "pollResponse",
                                "browserTime"
                            ],
                            "fields": [
                                {
                                    "followUpResponses": {
                                        "first": "followUpResponses"
                                    }
                                }
                            ]
                        }
                    },
                    {
                        "eval": {
                            "followUpResponse": "followUpResponses.pollResponse"
                        }
                    }
                ]
            }
        },
        {
            "bulkExpand": {
                "account": {
                    "account": "accountId"
                }
            }
        },
        {
            "eval": {
                "account_auto_id": "account.auto.id"
            }
        },
        {
            "select": {
                "visitorId": "visitorId",
                "browserTime": "browserTime",
							  "accountId": "account_auto_id",
                "qualitativeResponse": "followUpResponse",
                "quantitativeResponse": "pollResponse",
                "channel": "type"
            }
        }
    ],
        "requestId": "NPSResponses"
    }
}
```

**Note:** The above API call will retrieve data for the previous 365 days from whatever epoch date value you entered in the portion of the call below:

```
 "timeSeries": {
           "period": "dayRange",
           "first": <paste epoch time for today in this format 1485907200000 here>,
           "count": 365
               }
```

If your NPS poll has been active for longer than 365 days and you want to extend the API call to gather data from a period beyond the prior year, you can change the `count` value to something greater than 365 (i.e. 730 for 2 years).

Now that you have a running API call that is gathering the data you want to visualize, it's time to move on to Step 2.

## Step 2 - Extract and Transform the data then load it into SNowflake using Xplenty:

What is Xplenty?

Xplenty is a leading Extract, Transform and Load (ETL) tool to help you easily move data from one data source to another.

Why did we used it for this example?

Xplenty is the tool Pendo uses internally to move data from a variety of sources (Pendo, Marketo, Salesforce, etc.) into a reporting data warehouse for BI purposes.  It was handy and is super simple to us.  

You could use whatever ETL tool, scripts, etc. you're comfortable with.  The following instructions should be useful in a general sense if you elect to use an alternative to Xplenty.

**Getting started**
- Log in and click New Package
- Name the package, leave Type as Dataflow, leave Template set to Blank, and click Create Package.
- From within the Package, Build the Dataflow by clicking Add component.
- Select API - Rest API under Sources

**Build the API call**
- Leave authentication set to None. Click Next.
- Choose the POST method with the dropdown option
- Copy the API URL from your RESTful API client and paste into the URL field next to Post
- Copy the Key names and Values from your RESTful API client’s Headers and paste as keys and values under Headers
- Copy the request body your RESTful API client for the second API call you created above and paste it into the Body field
- Leave the Response type set to JSON. Enter `$.results[*]` into the Base record JSONPath Expression field. Click Next.

It might take a little while for the input fields to render (API is firing and bringing back column headings). Once it renders, click Select all in Available Fields to add all the columns to the Selected Fields. Click Save to close the API building interface.

With this API built in Xplenty, you can configure transformations and destinations to fulfill your specific use case. To add a transformation, click the + Add component button and select a transformation component. Add it to your package, connect it upstream to your Source and downstream to you Destination database, refresh available fields.

Xplenty makes transformations simple, although the syntax can be a little counterintuitive at first. [Review their documentation](http://community.xplenty.com/knowledgebase/articles/173787-xplenty-functions) to familiarize yourself with the available functions. Notably, we used the date transformation function to convert epoch time to a human-readable date before loading it into Snowflake.  In addition, the SHA256 hash function is a perfect way to protect PII data.

Now that your data is flowing into Xplenty and Transformed to your specifications, our example continues using Snowflake as a target destination.

Xplenty must first be allowed access to your Snowflake data warehouse and a selcted schema/database combination [as described in their documentation](http://community.xplenty.com/knowledgebase/articles/1827793-allowing-xplenty-access-to-my-snowflake-account).

**Note:** When setting up the Snowflake connection within Xplenty, be sure to input all data warehouse, schema and table names using **ALL CAPS** as Looker will not be able to excute queries against this data set if you don't.

**Add Snowflake Component**
- Click the Add Component button then, under Destinations, select Google BigQuery.
- Select a target connection, Click next
- Enter a name **in ALL CAPS** for a Target table you want to create. Set the checkboxes and Operation type to meet your data needs. Scroll down and click Next
- Click the Auto-fill button to match the Input Fields to the Destination Columns.
- Click Save.
- Click the Save & Run job button to see if what you built will run successfully. Select the cluster to run the job on, select the package you just created, and since there are no User or System variables to define in this case, skip the Edit package variables step and click Run Job.

You should be presented with a message indicating the job number and which cluster the job is running on. Click the job status icon in the left nav to open the job status panel. If all is well with your package it will move past 0% after a bit then show 50%. If there is a problem, it will go from 0% to Failed status.

The job will show 100% and running, but is only complete when the status changes to 100% and complete. When you see that status, the job ran successfully and the data is now available in Snowflake.

## Step 3 - Verifying the data is loaded into SNowflake:



