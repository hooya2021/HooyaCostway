view: salesrule_coupon {
  sql_table_name: `costway_com.salesrule_coupon`
    ;;

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: coupon_id {
    type: number
    sql: ${TABLE}.coupon_id ;;
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

  dimension_group: expiration {
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
    sql: ${TABLE}.expiration_date ;;
  }

  dimension: hostname {
    type: string
    sql: ${TABLE}.hostname ;;
  }

  dimension: is_primary {
    type: number
    sql: ${TABLE}.is_primary ;;
  }

  dimension: rule_id {
    type: number
    sql: ${TABLE}.rule_id ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_date ;;
  }

  dimension: times_used {
    type: number
    sql: ${TABLE}.times_used ;;
  }

  dimension: type {
    type: number
    sql: ${TABLE}.type ;;
  }

  dimension: usage_limit {
    type: number
    sql: ${TABLE}.usage_limit ;;
  }

  dimension: usage_per_customer {
    type: number
    sql: ${TABLE}.usage_per_customer ;;
  }

  measure: count {
    type: count
    drill_fields: [hostname]
  }
}
