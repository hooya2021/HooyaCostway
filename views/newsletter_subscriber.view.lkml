view: newsletter_subscriber {
  sql_table_name: `costway_com.newsletter_subscriber`
    ;;

  dimension_group: change_status {
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
    sql: ${TABLE}.change_status_at ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer_phone {
    type: string
    sql: ${TABLE}.customer_phone ;;
  }

  dimension: email_source {
    type: string
    sql: ${TABLE}.email_source ;;
  }

  dimension: hostname {
    type: string
    sql: ${TABLE}.hostname ;;
  }

  dimension: is_subscriber_phone {
    type: number
    sql: ${TABLE}.is_subscriber_phone ;;
  }

  dimension: mobile_source {
    type: string
    sql: ${TABLE}.mobile_source ;;
  }

  dimension_group: phone_created {
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
    sql: ${TABLE}.phone_created_at ;;
  }

  dimension: store_id {
    type: number
    sql: ${TABLE}.store_id ;;
  }

  dimension: subscriber_confirm_code {
    type: string
    sql: ${TABLE}.subscriber_confirm_code ;;
  }

  dimension_group: subscriber_created {
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
    sql: cast(subscriber_created_at as timestamp) ;;
  }

  dimension: subscriber_email {
    type: string
    sql: ${TABLE}.subscriber_email ;;
  }

  dimension: subscriber_id {
    type: number
    sql: ${TABLE}.subscriber_id ;;
  }

  dimension: subscriber_status {
    type: number
    sql: ${TABLE}.subscriber_status ;;
  }

  dimension_group: unphone_created {
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
    sql: ${TABLE}.unphone_created_at ;;
  }

  dimension_group: unsubscriber_created {
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
    sql: ${TABLE}.unsubscriber_created_at ;;
  }

  measure: count {
    type: count
    drill_fields: [hostname]
  }
}
