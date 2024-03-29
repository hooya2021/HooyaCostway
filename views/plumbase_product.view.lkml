view: plumbase_product {
  sql_table_name: `costway_com.plumbase_product`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: hostname {
    type: string
    sql: ${TABLE}.hostname ;;
  }

  dimension: signature {
    type: string
    sql: ${TABLE}.signature ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  measure: count {
    type: count
    drill_fields: [id, hostname]
  }
}
