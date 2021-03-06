- dashboard: pendo_nps_dashboard
  title: Pendo NPS Dashboard
  layout: newspaper
  elements:
  - title: NPS Average - Email
    name: NPS Average - Email
    model: pendo_NPS
    explore: nps
    type: single_value
    fields:
    - nps.channel
    - nps.avg_nps_rating
    filters:
      nps.channel: Email
    sorts:
    - nps.avg_nps_rating desc
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: Average NPS Rating - Email
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: nps.total_promoters
        name: Internalnps Number of Promoters
        axisId: nps.total_promoters
        __FILE: pendo_NPS/pendo_nps_dashboard.dashboard.lookml
        __LINE_NUM: 41
      - id: nps.total_passives
        name: Internalnps Number of Passives
        axisId: nps.total_passives
        __FILE: pendo_NPS/pendo_nps_dashboard.dashboard.lookml
        __LINE_NUM: 44
      - id: nps.total_detractors
        name: Internalnps Number of Detractors
        axisId: nps.total_detractors
        __FILE: pendo_NPS/pendo_nps_dashboard.dashboard.lookml
        __LINE_NUM: 47
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: pendo_NPS/pendo_nps_dashboard.dashboard.lookml
      __LINE_NUM: 38
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Channel
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 22
    col: 16
    width: 8
    height: 3
  - title: NPS Average - Web App
    name: NPS Average - Web App
    model: pendo_NPS
    explore: nps
    type: single_value
    fields:
    - nps.channel
    - nps.avg_nps_rating
    filters:
      nps.channel: Web App
    sorts:
    - nps.avg_nps_rating desc
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: Average NPS Rating - Web App
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: nps.total_promoters
        name: Internalnps Number of Promoters
        axisId: nps.total_promoters
        __FILE: pendo_NPS/pendo_nps_dashboard.dashboard.lookml
        __LINE_NUM: 113
      - id: nps.total_passives
        name: Internalnps Number of Passives
        axisId: nps.total_passives
        __FILE: pendo_NPS/pendo_nps_dashboard.dashboard.lookml
        __LINE_NUM: 116
      - id: nps.total_detractors
        name: Internalnps Number of Detractors
        axisId: nps.total_detractors
        __FILE: pendo_NPS/pendo_nps_dashboard.dashboard.lookml
        __LINE_NUM: 119
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: pendo_NPS/pendo_nps_dashboard.dashboard.lookml
      __LINE_NUM: 110
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Channel
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 22
    col: 8
    width: 8
    height: 3
  - title: 90 Day NPS - Overall
    name: 90 Day NPS - Overall
    model: pendo_NPS
    explore: nps
    type: single_value
    fields:
    - nps.total_detractors
    - nps.total_passives
    - nps.total_promoters
    - nps.count
    filters:
      nps.browsertime_date: 90 days
    sorts:
    - calculation_1 desc
    limit: 500
    dynamic_fields:
    - table_calculation: calculation_1
      label: Calculation 1
      expression: "((${nps.total_promoters} / ${nps.count} - (${nps.total_detractors}\
        \ / ${nps.count}))*100)"
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: 90 Day NPS - Overall
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields:
    - nps.count
    - nps.total_promoters
    - nps.total_passives
    - nps.total_detractors
    series_types: {}
    listen: {}
    row: 5
    col: 0
    width: 12
    height: 3
  - title: 1 Year NPS Trend - Overall and by Channel
    name: 1 Year NPS Trend - Overall and by Channel
    model: pendo_NPS
    explore: nps
    type: looker_line
    fields:
    - nps.browsertime_month
    - nps.total_detractors
    - nps.total_passives
    - nps.total_promoters
    - nps.count
    - nps.channel
    pivots:
    - nps.channel
    fill_fields:
    - nps.browsertime_month
    sorts:
    - nps.channel 0
    - overall_nps
    limit: 500
    row_total: right
    dynamic_fields:
    - table_calculation: nps
      label: NPS
      expression: "((${nps.total_promoters} / ${nps.count} - (${nps.total_detractors}\
        \ / ${nps.count}))*100)"
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: overall_nps
      label: Overall NPS
      expression: "((${nps.total_promoters:row_total} / ${nps.count:row_total}) -\
        \ (${nps.total_detractors:row_total} / ${nps.count:row_total}))*100"
      value_format:
      value_format_name: decimal_0
      _kind_hint: supermeasure
      _type_hint: number
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      Email - nps: "#928fb4"
      Web App - nps: "#cee0a0"
      overall_nps: "#1f3e5a"
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: Email - nps
        name: Email - NPS
        axisId: nps
        __FILE: pendo_NPS/pendo_nps_dashboard.dashboard.lookml
        __LINE_NUM: 292
      - id: Web App - nps
        name: Web App - NPS
        axisId: nps
        __FILE: pendo_NPS/pendo_nps_dashboard.dashboard.lookml
        __LINE_NUM: 295
      - id: overall_nps
        name: Overall NPS
        axisId: overall_nps
        __FILE: pendo_NPS/pendo_nps_dashboard.dashboard.lookml
        __LINE_NUM: 298
      showLabels: true
      showValues: true
      maxValue:
      minValue:
      unpinAxis: false
      tickDensity: custom
      tickDensityCustom: 5
      type: linear
      __FILE: pendo_NPS/pendo_nps_dashboard.dashboard.lookml
      __LINE_NUM: 289
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Month
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: false
    interpolation: linear
    hidden_fields:
    - nps.total_detractors
    - nps.total_passives
    - nps.total_promoters
    - nps.count
    listen: {}
    row: 8
    col: 0
    width: 24
    height: 7
  - title: Number of NPS Responses Overall
    name: Number of NPS Responses Overall
    model: pendo_NPS
    explore: nps
    type: looker_line
    fields:
    - nps.browsertime_month
    - nps.total_detractors
    - nps.total_passives
    - nps.total_promoters
    fill_fields:
    - nps.browsertime_month
    sorts:
    - nps.browsertime_month desc
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    colors:
    - "#5245ed"
    - "#ed6168"
    - "#1ea8df"
    - "#353b49"
    - "#49cec1"
    - "#b3a0dd"
    - "#db7f2a"
    - "#706080"
    - "#a2dcf3"
    - "#776fdf"
    - "#e9b404"
    - "#635189"
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      nps.total_detractors: "#ed6168"
      nps.total_passives: "#e9b404"
      nps.total_promoters: "#49cec1"
    series_labels:
      nps.total_detractors: Detractors
      nps.total_passives: Passives
      nps.total_promoters: Promoters
    series_types: {}
    series_point_styles:
      nps.total_detractors: square
      nps.total_promoters: diamond
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: nps.total_detractors
        name: Detractors
        axisId: nps.total_detractors
        __FILE: pendo_NPS/pendo_nps_dashboard.dashboard.lookml
        __LINE_NUM: 387
      - id: nps.total_passives
        name: Passives
        axisId: nps.total_passives
        __FILE: pendo_NPS/pendo_nps_dashboard.dashboard.lookml
        __LINE_NUM: 390
      - id: nps.total_promoters
        name: Promoters
        axisId: nps.total_promoters
        __FILE: pendo_NPS/pendo_nps_dashboard.dashboard.lookml
        __LINE_NUM: 393
      showLabels: true
      showValues: true
      maxValue:
      minValue:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 14
      type: linear
      __FILE: pendo_NPS/pendo_nps_dashboard.dashboard.lookml
      __LINE_NUM: 384
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Month
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trend_lines: []
    show_null_points: true
    interpolation: linear
    listen: {}
    row: 15
    col: 0
    width: 24
    height: 7
  - title: NPS Promoters - Last 10 with Comments
    name: NPS Promoters - Last 10 with Comments
    model: pendo_NPS
    explore: nps
    type: table
    fields:
    - nps.browsertime_date
    - nps.accountid
    - nps.qualitativeresponse
    - nps.nps_rating
    filters:
      nps.nps_rating: ">9"
      nps.qualitativeresponse: "-NULL"
    sorts:
    - nps.browsertime_date desc
    limit: 10
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      nps.browser_time: Date
      nps.qualitative_response: Response
      nps.browsertime_date: Date
      nps.accountid: Account
      nps.qualitativeresponse: Response
      nps.nps_rating: NPS Rating
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting:
    - type: greater than
      value: 9
      background_color: "#74bab3"
      font_color: "#f5ffff"
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
        __FILE: pendo_NPS/pendo_nps_dashboard.dashboard.lookml
        __LINE_NUM: 464
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: pendo_NPS/pendo_nps_dashboard.dashboard.lookml
      __LINE_NUM: 459
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 35
    col: 0
    width: 8
    height: 10
  - title: NPS Detractors - Last 10 with Comments
    name: NPS Detractors - Last 10 with Comments
    model: pendo_NPS
    explore: nps
    type: table
    fields:
    - nps.browsertime_date
    - nps.accountid
    - nps.qualitativeresponse
    - nps.nps_rating
    filters:
      nps.nps_rating: "<7"
      nps.qualitativeresponse: "-NULL"
    sorts:
    - nps.browsertime_date desc
    limit: 10
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      nps.browser_time: Date
      nps.qualitative_response: Response
      nps.browsertime_date: Date
      nps.accountid: Account
      nps.qualitativeresponse: Response
      nps.nps_rating: NPS Rating
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting:
    - type: less than
      value: 7
      background_color: "#edb7bf"
      font_color: "#f8fffc"
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
        __FILE: pendo_NPS/pendo_nps_dashboard.dashboard.lookml
        __LINE_NUM: 519
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: pendo_NPS/pendo_nps_dashboard.dashboard.lookml
      __LINE_NUM: 514
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 35
    col: 16
    width: 8
    height: 10
  - title: NPS Rating - Overall
    name: NPS Rating - Overall
    model: pendo_NPS
    explore: nps
    type: single_value
    fields:
    - nps.avg_nps_rating
    sorts:
    - nps.avg_nps_rating desc
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: Average NPS Rating - Overall
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: nps.total_promoters
        name: Internalnps Number of Promoters
        axisId: nps.total_promoters
        __FILE: pendo_NPS/pendo_nps_dashboard.dashboard.lookml
        __LINE_NUM: 581
      - id: nps.total_passives
        name: Internalnps Number of Passives
        axisId: nps.total_passives
        __FILE: pendo_NPS/pendo_nps_dashboard.dashboard.lookml
        __LINE_NUM: 584
      - id: nps.total_detractors
        name: Internalnps Number of Detractors
        axisId: nps.total_detractors
        __FILE: pendo_NPS/pendo_nps_dashboard.dashboard.lookml
        __LINE_NUM: 587
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: pendo_NPS/pendo_nps_dashboard.dashboard.lookml
      __LINE_NUM: 578
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Channel
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 22
    col: 0
    width: 8
    height: 3
  - title: NPS Passive - Last 10 with Comments
    name: NPS Passive - Last 10 with Comments
    model: pendo_NPS
    explore: nps
    type: table
    fields:
    - nps.browsertime_date
    - nps.accountid
    - nps.qualitativeresponse
    - nps.nps_rating
    filters:
      nps.qualitativeresponse: "-NULL"
      nps.nps_rating: '7,8'
    sorts:
    - nps.browsertime_date desc
    limit: 10
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      nps.browser_time: Date
      nps.qualitative_response: Response
      nps.browsertime_date: Date
      nps.accountid: Account
      nps.qualitativeresponse: Response
      nps.nps_rating: NPS Rating
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting:
    - type: not null
      value:
      background_color: "#ede05f"
      font_color: "#000000"
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
        __FILE: pendo_NPS/pendo_nps_dashboard.dashboard.lookml
        __LINE_NUM: 657
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: pendo_NPS/pendo_nps_dashboard.dashboard.lookml
      __LINE_NUM: 652
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 35
    col: 8
    width: 8
    height: 10
  - title: NPS Promoters-Passive-Detractors - Overall
    name: NPS Promoters-Passive-Detractors - Overall
    model: pendo_NPS
    explore: nps
    type: looker_column
    fields:
    - nps.total_promoters
    - nps.total_passives
    - nps.total_detractors
    sorts:
    - nps.total_promoters desc
    limit: 500
    row_total: left
    stacking: ''
    colors:
    - "#5245ed"
    - "#ed6168"
    - "#1ea8df"
    - "#353b49"
    - "#49cec1"
    - "#b3a0dd"
    - "#db7f2a"
    - "#706080"
    - "#a2dcf3"
    - "#776fdf"
    - "#e9b404"
    - "#635189"
    show_value_labels: true
    label_density: 25
    legend_position: center
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      nps.total_promoters: "#74bab3"
      nps.total_passives: "#ede05f"
      nps.total_detractors: "#edb7bf"
      Email - nps.total_promoters: "#777777"
      Web App - nps.total_promoters: "#292929"
      Row Total - nps.total_promoters: "#74bab3"
      Email - nps.total_passives: "#a3a3a3"
      Web App - nps.total_passives: "#8d8d8d"
      Row Total - nps.total_passives: "#ede05f"
      Email - nps.total_detractors: "#d0d0d0"
      Web App - nps.total_detractors: "#e7e7e7"
      Row Total - nps.total_detractors: "#edb7bf"
    series_labels:
      Email - nps.total_promoters: Email - Promoters
      Web App - nps.total_promoters: Web App - Promoters
      Row Total - nps.total_promoters: Overall - Promoters
      Email - nps.total_passives: Email - Passives
      Web App - nps.total_passives: Web App - Passives
      Row Total - nps.total_passives: Overall - Passives
      Email - nps.total_detractors: Email - Detractors
      Web App - nps.total_detractors: Web App - Detractors
      Row Total - nps.total_detractors: Overall - Detractors
      nps.total_promoters: Promoters
      nps.total_passives: Passive
      nps.total_detractors: Detractors
    series_types: {}
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: nps.total_promoters
        name: Promoters
        axisId: nps.total_promoters
      - id: nps.total_passives
        name: Passive
        axisId: nps.total_passives
      - id: nps.total_detractors
        name: Detractors
        axisId: nps.total_detractors
      showLabels: true
      showValues: true
      maxValue: 2500
      minValue: 0
      unpinAxis: false
      tickDensity: default
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Overall
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    column_spacing_ratio: 0.2
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    query_timezone: America/Los_Angeles
    listen: {}
    row: 25
    col: 0
    width: 8
    height: 10
  - title: NPS Promoters-Passive-Detractors - Web App
    name: NPS Promoters-Passive-Detractors - Web App
    model: pendo_NPS
    explore: nps
    type: looker_column
    fields:
    - nps.total_promoters
    - nps.total_passives
    - nps.total_detractors
    - nps.channel
    filters:
      nps.channel: Web App
    sorts:
    - nps.total_promoters desc
    limit: 500
    row_total: left
    stacking: ''
    colors:
    - "#5245ed"
    - "#ed6168"
    - "#1ea8df"
    - "#353b49"
    - "#49cec1"
    - "#b3a0dd"
    - "#db7f2a"
    - "#706080"
    - "#a2dcf3"
    - "#776fdf"
    - "#e9b404"
    - "#635189"
    show_value_labels: true
    label_density: 25
    legend_position: center
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      nps.total_promoters: "#74bab3"
      nps.total_passives: "#ede05f"
      nps.total_detractors: "#edb7bf"
      Email - nps.total_promoters: "#777777"
      Web App - nps.total_promoters: "#292929"
      Row Total - nps.total_promoters: "#74bab3"
      Email - nps.total_passives: "#a3a3a3"
      Web App - nps.total_passives: "#8d8d8d"
      Row Total - nps.total_passives: "#ede05f"
      Email - nps.total_detractors: "#d0d0d0"
      Web App - nps.total_detractors: "#e7e7e7"
      Row Total - nps.total_detractors: "#edb7bf"
    series_labels:
      Email - nps.total_promoters: Email - Promoters
      Web App - nps.total_promoters: Web App - Promoters
      Row Total - nps.total_promoters: Overall - Promoters
      Email - nps.total_passives: Email - Passives
      Web App - nps.total_passives: Web App - Passives
      Row Total - nps.total_passives: Overall - Passives
      Email - nps.total_detractors: Email - Detractors
      Web App - nps.total_detractors: Web App - Detractors
      Row Total - nps.total_detractors: Overall - Detractors
      nps.total_promoters: Promoters
      nps.total_passives: Passive
      nps.total_detractors: Detractors
    series_types: {}
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: nps.total_promoters
        name: Promoters
        axisId: nps.total_promoters
      - id: nps.total_passives
        name: Passive
        axisId: nps.total_passives
      - id: nps.total_detractors
        name: Detractors
        axisId: nps.total_detractors
      showLabels: true
      showValues: true
      maxValue: 2500
      minValue: 0
      unpinAxis: false
      tickDensity: default
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    x_axis_label: ''
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    column_spacing_ratio: 0.2
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    query_timezone: America/Los_Angeles
    listen: {}
    row: 25
    col: 8
    width: 8
    height: 10
  - title: NPS Promoters-Passive-Detractors - Email
    name: NPS Promoters-Passive-Detractors - Email
    model: pendo_NPS
    explore: nps
    type: looker_column
    fields:
    - nps.total_promoters
    - nps.total_passives
    - nps.total_detractors
    - nps.channel
    filters:
      nps.channel: Email
    sorts:
    - nps.total_promoters desc
    limit: 500
    row_total: left
    stacking: ''
    colors:
    - "#5245ed"
    - "#ed6168"
    - "#1ea8df"
    - "#353b49"
    - "#49cec1"
    - "#b3a0dd"
    - "#db7f2a"
    - "#706080"
    - "#a2dcf3"
    - "#776fdf"
    - "#e9b404"
    - "#635189"
    show_value_labels: true
    label_density: 25
    legend_position: center
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      nps.total_promoters: "#74bab3"
      nps.total_passives: "#ede05f"
      nps.total_detractors: "#edb7bf"
      Email - nps.total_promoters: "#777777"
      Web App - nps.total_promoters: "#292929"
      Row Total - nps.total_promoters: "#74bab3"
      Email - nps.total_passives: "#a3a3a3"
      Web App - nps.total_passives: "#8d8d8d"
      Row Total - nps.total_passives: "#ede05f"
      Email - nps.total_detractors: "#d0d0d0"
      Web App - nps.total_detractors: "#e7e7e7"
      Row Total - nps.total_detractors: "#edb7bf"
    series_labels:
      Email - nps.total_promoters: Email - Promoters
      Web App - nps.total_promoters: Web App - Promoters
      Row Total - nps.total_promoters: Overall - Promoters
      Email - nps.total_passives: Email - Passives
      Web App - nps.total_passives: Web App - Passives
      Row Total - nps.total_passives: Overall - Passives
      Email - nps.total_detractors: Email - Detractors
      Web App - nps.total_detractors: Web App - Detractors
      Row Total - nps.total_detractors: Overall - Detractors
      nps.total_promoters: Promoters
      nps.total_passives: Passive
      nps.total_detractors: Detractors
    series_types: {}
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: nps.total_promoters
        name: Promoters
        axisId: nps.total_promoters
      - id: nps.total_passives
        name: Passive
        axisId: nps.total_passives
      - id: nps.total_detractors
        name: Detractors
        axisId: nps.total_detractors
      showLabels: true
      showValues: true
      maxValue: 2500
      minValue: 0
      unpinAxis: false
      tickDensity: default
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    x_axis_label: ''
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    column_spacing_ratio: 0.2
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    query_timezone: America/Los_Angeles
    listen: {}
    row: 25
    col: 16
    width: 8
    height: 10
  - title: 30 Day NPS - Overall
    name: 30 Day NPS - Overall
    model: pendo_NPS
    explore: nps
    type: single_value
    fields:
    - nps.total_detractors
    - nps.total_passives
    - nps.total_promoters
    - nps.count
    filters:
      nps.browsertime_date: 30 days
    sorts:
    - nps.count desc
    limit: 500
    dynamic_fields:
    - table_calculation: calculation_1
      label: Calculation 1
      expression: "((${nps.total_promoters} / ${nps.count} - (${nps.total_detractors}\
        \ / ${nps.count}))*100)"
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: 30 Day NPS - Overall
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    hidden_fields:
    - nps.count
    - nps.total_promoters
    - nps.total_passives
    - nps.total_detractors
    listen: {}
    row: 5
    col: 12
    width: 12
    height: 3
  - name: Pendo NPS
    type: text
    title_text: Pendo NPS
    subtitle_text: Why you should care about NPS and how Pendo can help
    body_text: |-
      Are you new to NPS (Net Promoter Score) and want to learn more?  Start with [an overview of NPS ](https://www.pendo.io/vox/?utm_medium=cpc&utm_source=google&utm_campaign=1474681646-58843506444&utm_content=282821087494--kwd-155846096-c&utm_term=nps-p&gclid=EAIaIQobChMIoeWlh53C3gIVTj0MCh2ZhA7bEAAYASAAEgKcuPD_BwE) from Pendo.

      Better yet, take a test drive of Pendo NPS with [this demo](https://www.pendo.io/product/nps/).

      Still wanting more?  check out [Pendo's Big NPS Playbook](http://go.pendo.io/Big-NPS-Playbook.html) or, better yet, install [Pendo Vox](https://www.pendo.io/vox/?utm_medium=cpc&utm_source=google&utm_campaign=1474681646-58843506444&utm_content=282821087494--kwd-155846096-c&utm_term=nps-p&gclid=EAIaIQobChMIoeWlh53C3gIVTj0MCh2ZhA7bEAAYASAAEgKcuPD_BwE) - a free version of Pendo's NPS solution - in your application.
    row: 0
    col: 0
    width: 24
    height: 5
