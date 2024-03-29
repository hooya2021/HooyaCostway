view: eav_attribute_group {
  sql_table_name: `costway_com.eav_attribute_group`
    ;;

  dimension: attribute_group_id {
    type: number
    sql: ${TABLE}.attribute_group_id ;;
  }

  dimension: attribute_group_name {
    type: string
    sql: ${TABLE}.attribute_group_name ;;
  }

  dimension: attribute_set_id {
    type: number
    sql: ${TABLE}.attribute_set_id ;;
  }

  dimension: default_id {
    type: number
    sql: ${TABLE}.default_id ;;
  }

  dimension: hostname {
    type: string
    sql: ${TABLE}.hostname ;;
  }

  dimension: sort_order {
    type: number
    sql: ${TABLE}.sort_order ;;
  }

  measure: count {
    type: count
    drill_fields: [hostname, attribute_group_name]
  }
}
