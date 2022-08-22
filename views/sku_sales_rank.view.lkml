view: sku_sales_rank {
  derived_table: {
    sql: select item.created_at,SKU, SUM(item.row_total-item.discount_amount+item.tax_amount) as sku_sales, rank() over (order by SUM(item.row_total-item.discount_amount+item.tax_amount) DESC) AS Rank
      from `alidbtogcp.costway_com.sales_flat_order_item` as item
      left join `alidbtogcp.costway_com.sales_flat_order` as sales_flat_order on item.order_id = sales_flat_order.entity_id
      group by 1,2
       ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.SKU ;;
  }

  dimension: sku_sales {
    type: number
    sql: ${TABLE}.sku_sales ;;
  }

  dimension: rank_raw {
    type: number
    sql: ${TABLE}.Rank ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }


  parameter: max_sku {
    type: number
  }

  dimension: rank {
    type: string
    sql: CASE WHEN ${rank_raw} <= {% parameter max_sku %} THEN RIGHT('00' + CAST(${rank_raw} AS VARCHAR), 2) ELSE 'Other' END ;;
  }
}
