view: coupon_used_2021_jessi {
  derived_table: {
    sql: SELECT
          (DATE(sales_flat_order.created_at , 'America/Los_Angeles')) AS Date,
          sales_flat_order.coupon_rule_name  AS coupon_rule_name,
          COUNT(DISTINCT sales_flat_order.increment_id) AS coupon_used,
          COALESCE(SUM(CAST(sales_flat_order.grand_total AS FLOAT64)), 0) AS grand_total,
          COUNT(DISTINCT customer_entity.email) AS count_of_new_customer
      from  costway_com.sales_flat_order

      left join customer_entity on (DATE(sales_flat_order.created_at , 'America/Los_Angeles')) = (DATE(customer_entity.created_at , 'America/Los_Angeles'))

      WHERE (sales_flat_order.coupon_rule_name ) IN ('Newsletter $15 Coupon 2021 New', 'Register $10 Coupon 2021', 'Register $40 Coupon 2021')
      GROUP BY
          1,
          2
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: date {
    type: date
    datatype: date
    sql: ${TABLE}.Date ;;
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
    fields: [date, coupon_rule_name, coupon_used, grand_total, count_of_new_customer]
  }
}
