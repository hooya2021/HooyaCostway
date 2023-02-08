view: aw_points_transaction_orderspend {
  sql_table_name: `costway_com.aw_points_transaction_orderspend`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: base_points_to_money {
    type: number
    sql: ${TABLE}.base_points_to_money ;;
  }

  dimension: hostname {
    type: string
    sql: ${TABLE}.hostname ;;
  }

  dimension: order_increment_id {
    type: string
    sql: ${TABLE}.order_increment_id ;;
  }

  dimension: points_to_money {
    type: number
    sql: -${TABLE}.points_to_money ;;
  }

  dimension: transaction_id {
    type: number
    sql: ${TABLE}.transaction_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, hostname]
  }
}
