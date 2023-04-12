view: customer_total_order_num {
 derived_table: {
  sql: SELECT
          lower(sales_flat_order.customer_email)  AS sales_flat_order_customer_email_transfer,
          COUNT(DISTINCT sales_flat_order.increment_id) AS total_order_num
      FROM `costway_com.sales_flat_order`
           AS sales_flat_order
      LEFT JOIN `costway_com.customer_group`
           AS customer_group ON sales_flat_order.customer_group_id = customer_group.customer_group_id
      WHERE ((sales_flat_order.customer_email ) <> 'xhzhang1992@126.com' AND ((sales_flat_order.customer_email ) <> 'xhzhang2018@gmail.com' AND (sales_flat_order.customer_email ) <> '1060122939@qq.com') AND ((sales_flat_order.customer_email ) <> '3001570951@qq.com' AND ((sales_flat_order.customer_email ) <> '969408250@qq.com' AND (sales_flat_order.customer_email ) <> '2278600338@qq.com')) AND ((sales_flat_order.customer_email ) <> '3474799858@qq.com' AND ((sales_flat_order.customer_email ) <> 'isaac88669@gmail.com' AND (sales_flat_order.customer_email ) <> 'max.ma@fdsintl.com') AND ((sales_flat_order.customer_email ) <> '624632385@qq.com' AND ((sales_flat_order.customer_email ) <> 'marketing@costway.com' AND (sales_flat_order.customer_email ) <> '1207313005@qq.com'))) OR (sales_flat_order.customer_email ) IS NULL) AND (sales_flat_order.status ) IN ('complete', 'completed', 'pending_refund', 'processing', 'refunded', 'shipping') AND ((customer_group.customer_group_code ) <> 'Business Partner' AND (customer_group.customer_group_code ) <> 'Business' AND ((customer_group.customer_group_code ) <> 'Dropship 10 Percent' AND ((customer_group.customer_group_code ) <> 'Dropship 15 Percent' AND (customer_group.customer_group_code ) <> 'Wholesale 20% OFF')) AND ((customer_group.customer_group_code ) <> 'testgroup' AND (customer_group.customer_group_code ) <> 'Large Order Group' AND ((customer_group.customer_group_code ) NOT LIKE '%Dropship%' AND ((customer_group.customer_group_code ) NOT LIKE '%dropship%' AND (customer_group.customer_group_code ) NOT LIKE '%qq.com%'))) OR (customer_group.customer_group_code ) IS NULL)
      GROUP BY
          1
       ;;
}

measure: count {
  type: count
  drill_fields: [detail*]
}

dimension: customer_email_transfer {
  type: string
  sql: ${TABLE}.sales_flat_order_customer_email_transfer ;;
}

dimension: total_order_num {
  type: number
  sql: ${TABLE}.total_order_num ;;
}

set: detail {
  fields: [customer_email_transfer, total_order_num]
}
}
