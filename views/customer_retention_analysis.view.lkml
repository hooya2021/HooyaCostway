view: customer_retention_analysis {
  derived_table: {
    sql: SELECT sales_flat_order.customer_id,status,min(sales_flat_order.increment_id) as first_order_number,
      max(sales_flat_order.increment_id) as latest_order_number,
      min(sales_flat_order.created_at) as first_order_time,
      max(sales_flat_order.created_at) as latest_order_time,
      customer_entity.created_at as customer_created_time,
      newsletter_subscriber.subscriber_created_at as subscriber_created_at
      FROM `alidbtogcp.costway_com.sales_flat_order` as sales_flat_order

      left join `alidbtogcp.costway_com.customer_entity` as customer_entity on customer_entity.entity_id = sales_flat_order.customer_id
      left join `alidbtogcp.costway_com.newsletter_subscriber` as newsletter_subscriber on newsletter_subscriber.customer_id = sales_flat_order.customer_id
      GROUP BY customer_id,customer_created_time,subscriber_created_at,status
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: order_status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: first_order_number {
    type: string
    sql: ${TABLE}.first_order_number ;;
  }

  dimension: latest_order_number {
    type: string
    sql: ${TABLE}.latest_order_number ;;
  }

  dimension_group: first_order_time {
    type: time
    sql: ${TABLE}.first_order_time ;;
  }

  dimension_group: latest_order_time {
    type: time
    timeframes: [
      raw,
      time,
      hour_of_day,
      hour6,
      date,
      week,
      day_of_week,
      month,
      quarter,
      year
    ]
    sql:${TABLE}.latest_order_time ;;
  }

  dimension_group: return_after_user_created {

    type: duration

    sql_start: ${TABLE}.customer_created_time ;;

    sql_end: ${TABLE}.latest_order_time ;;

  }

  dimension_group: date_after_user_created {
    type: duration
    sql_start: ${TABLE}.customer_created_time ;;
    sql_end: ${TABLE}.first_order_time  ;;
  }


  dimension_group: customer_created_time {
    type: time
    timeframes: [
      raw,
      time,
      hour_of_day,
      hour6,
      date,
      week,
      day_of_week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.customer_created_time ;;
  }

  dimension_group: subscriber_created_at {
    type: time
    timeframes: [
      raw,
      time,
      hour_of_day,
      hour6,
      date,
      week,
      day_of_week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.subscriber_created_at ;;
  }

  set: detail {
    fields: [
      customer_id,
      first_order_number,
      latest_order_number,
      first_order_time_time,
      latest_order_time_time,
      customer_created_time_time,
      subscriber_created_at_time
    ]
  }
}
