view: coupon_used_2021_jessi {
  derived_table: {
    sql: SELECT
          (EXTRACT(YEAR FROM sales_flat_order.created_at  AT TIME ZONE 'America/Los_Angeles')) AS sales_flat_order_created_year,
          (FORMAT_TIMESTAMP('%F', TIMESTAMP_TRUNC(sales_flat_order.created_at , WEEK(MONDAY), 'America/Los_Angeles'), 'America/Los_Angeles')) AS sales_flat_order_created_week,
          (DATE(sales_flat_order.created_at , 'America/Los_Angeles')) AS sales_flat_order_created_date,
          sales_flat_order.coupon_rule_name  AS coupon_rule_name,
          COUNT(DISTINCT sales_flat_order.increment_id) AS coupon_used,
          COALESCE(SUM(CAST(sales_flat_order.grand_total AS FLOAT64)), 0) AS grand_total,
          COUNT(DISTINCT customer_entity.email) AS count_of_new_customer
      from  costway_com.sales_flat_order

      left join customer_entity on (DATE(sales_flat_order.created_at , 'America/Los_Angeles')) = (DATE(customer_entity.created_at , 'America/Los_Angeles'))

      WHERE (sales_flat_order.coupon_rule_name ) IN ('Newsletter $15 Coupon 2021 New', 'Register $10 Coupon 2021', 'Register $40 Coupon 2021')
      GROUP BY
          1,
          2,
          3,
          4
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: sales_flat_order_created_year {
    type: number
    sql: ${TABLE}.sales_flat_order_created_year ;;
  }

  dimension: sales_flat_order_created_week {
    type: string
    sql: ${TABLE}.sales_flat_order_created_week ;;
  }

  dimension: sales_flat_order_created_date {
    type: date
    datatype: date
    sql: ${TABLE}.sales_flat_order_created_date ;;
  }

  dimension: coupon_rule_name {
    type: string
    sql: ${TABLE}.coupon_rule_name ;;
  }

  dimension: coupon_used {
    type: number
    sql: ${TABLE}.coupon_used ;;
  }

  dimension: grand_total {
    type: number
    sql: ${TABLE}.grand_total ;;
  }

  dimension: count_of_new_customer {
    type: number
    sql: ${TABLE}.count_of_new_customer ;;
  }

  set: detail {
    fields: [
      sales_flat_order_created_year,
      sales_flat_order_created_week,
      sales_flat_order_created_date,
      coupon_rule_name,
      coupon_used,
      grand_total,
      count_of_new_customer
    ]
  }
}
