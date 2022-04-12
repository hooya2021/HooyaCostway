view: sales_flat_order_source {
  sql_table_name: `costway_com.sales_flat_order_source`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: hostname {
    type: string
    sql: ${TABLE}.hostname ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: source_type {
    type: string
    sql: ${TABLE}.source_type;;
  }

  dimension: source {
    case: {
      when: {
        sql: ${TABLE}.source_type="mobile" ;;
        label: "Mobile"}
      when: {
        sql: ${TABLE}.source_type="ios" ;;
        label: "ios"
      }
      when: {
        sql: ${TABLE}.source_type="ipados" ;;
        label: "ipados"
        }
      when: {
        sql: ${TABLE}.source_type="app" ;;
        label: "app"
      }
      when: {
        sql: ${TABLE}.source_type="android" ;;
        label: "android"
      }
      else: "PC"
      }
    }

  measure: count {
    type: count
    drill_fields: [id, hostname]
  }
}
