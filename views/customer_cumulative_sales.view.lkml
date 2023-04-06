view: customer_cumulative_sales {
  derived_table: {
    sql: SELECT
          sales_flat_order.customer_email  AS customer_email,
          COALESCE(SUM(CAST(sales_flat_order.total_paid AS FLOAT64)), 0) AS sum_of_total_paid
      FROM `costway_com.sales_flat_order`
           AS sales_flat_order
      GROUP BY
          1;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: customer_email {
    type: string
    sql: ${TABLE}.customer_email ;;
  }

  dimension: turnover_value{
    type: number
    sql: ${TABLE}.sum_of_total_paid ;;
  }

  dimension: turnover_value_group{
    case: {
      when: {
        sql:${turnover_value}<100 ;;
        label: "<100"
      }
      when: {
        sql: 100<=${turnover_value} and ${turnover_value} <300 ;;
        label: "100-300"
      }
      when: {
        sql: 300<=${turnover_value} and ${turnover_value}<500;;
        label: "300-500"
      }
      when: {
        sql: 500<=${turnover_value} and ${turnover_value}<1000;;
        label: "500-1000"
      }
      when: {
        sql: ${turnover_value}>=1000 and ${turnover_value}<2000;;
        label: "1000-2000"
      }
      when: {
        sql: ${turnover_value}>=2000 and ${turnover_value}<3000;;
        label: "2000-3000"
      }
      when: {
        sql: ${turnover_value}>=3000 and ${turnover_value}<4000;;
        label: "3000-4000"
      }
      when: {
        sql: ${turnover_value}>=4000 and ${turnover_value}<5000;;
        label: "4000-5000"
      }
      when: {
        sql: ${turnover_value}>=5000 ;;
        label: ">5000"
      }
    }
    type: string
    sql:${turnover_value} ;;
  }


  set: detail {
    fields: [customer_email, turnover_value,turnover_value_group]
  }
}
