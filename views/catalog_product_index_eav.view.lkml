view: catalog_product_index_eav {
  sql_table_name: `costway_com.catalog_product_index_eav`
    ;;

  dimension: attribute_id {
    type: number
    sql: ${TABLE}.attribute_id ;;
  }

  dimension: entity_id {
    type: number
    sql: ${TABLE}.entity_id ;;
  }

  dimension: hostname {
    type: string
    sql: ${TABLE}.hostname ;;
  }

  dimension: store_id {
    type: number
    sql: ${TABLE}.store_id ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [hostname]
  }
}
