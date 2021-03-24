view: eav_form_fieldset {
  sql_table_name: `costway_com.eav_form_fieldset`
    ;;

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: fieldset_id {
    type: number
    sql: ${TABLE}.fieldset_id ;;
  }

  dimension: hostname {
    type: string
    sql: ${TABLE}.hostname ;;
  }

  dimension: sort_order {
    type: number
    sql: ${TABLE}.sort_order ;;
  }

  dimension: type_id {
    type: number
    sql: ${TABLE}.type_id ;;
  }

  measure: count {
    type: count
    drill_fields: [hostname]
  }
}