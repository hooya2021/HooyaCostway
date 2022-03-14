view: google_sheet_session {
  sql_table_name: `alidbtogcp.google_sheet.google_sheet_session`
    ;;

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: session {
    type: number
    sql: ${TABLE}.session ;;
  }

  dimension: weekday {
    type: string
    sql: ${TABLE}.weekday ;;
  }

  dimension: users {
    type: number
    sql: ${TABLE}.users ;;
  }

  dimension: new_users {
    type: number
    sql: ${TABLE}.new_users ;;
  }

dimension: bounce_rate {
  type: number
  sql: ${TABLE}.bounce_rate ;;
}
  measure: count {
    type: count
    drill_fields: []
  }
}
