view: google_sheet_target{
  sql_table_name: `alidbtogcp.google_sheet.google_sheet_网络销售目标`
    ;;

  dimension_group: period {
    type: time
    description: "%E4Y-%m-%d"
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Period ;;
  }

  dimension: website_target {
    type: number
    sql: ${TABLE}.website_target ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
