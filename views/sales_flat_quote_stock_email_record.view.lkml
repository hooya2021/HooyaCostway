view: sales_flat_quote_stock_email_record {
  sql_table_name: `costway_com.sales_flat_quote_stock_email_record`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: hostname {
    type: string
    sql: ${TABLE}.hostname ;;
  }

  dimension: quote_id {
    type: number
    sql: ${TABLE}.quote_id ;;
  }

  dimension: quote_item_id {
    type: number
    sql: ${TABLE}.quote_item_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, hostname]
  }
}
