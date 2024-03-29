view: sales_payment_transaction {
  sql_table_name: `costway_com.sales_payment_transaction`
    ;;

  dimension: additional_information {
    type: string
    sql: ${TABLE}.additional_information ;;
  }

  dimension: created_at {
    type: string
    sql: ${TABLE}.created_at ;;
  }

  dimension: is_closed {
    type: number
    sql: ${TABLE}.is_closed ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}.parent_id ;;
  }

  dimension: parent_txn_id {
    type: string
    sql: ${TABLE}.parent_txn_id ;;
  }

  dimension: payment_id {
    type: number
    sql: ${TABLE}.payment_id ;;
  }

  dimension: transaction_id {
    type: number
    sql: ${TABLE}.transaction_id ;;
  }

  dimension: txn_id {
    type: string
    sql: ${TABLE}.txn_id ;;
  }

  dimension: txn_type {
    type: string
    sql: ${TABLE}.txn_type ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
