view: plus_customer {
derived_table: {
  sql: select customer_plus.created_at as plus_created_at,email,customer_verify,customer_entity.created_at,customer_entity.entity_id from `alidbtogcp.costway_com.customer_plus_change_record` as customer_plus
      left join `alidbtogcp.costway_com.customer_entity` as customer_entity on customer_plus.customer_id = customer_entity.entity_id
       ;;
}

measure: count {
  type: count
  drill_fields: [detail*]
}

dimension_group: plus_created_at {
  type: time
  sql: cast(${TABLE}.plus_created_at as timestamp);;
}

dimension: email {
  type: string
  sql: ${TABLE}.email ;;
}

dimension: customer_id {
type: string
sql: ${TABLE}.entity_id ;;
}

dimension: customer_verify {
  type: number
  sql: ${TABLE}.customer_verify ;;
}

dimension_group: created_at {
  type: time
  sql: cast(${TABLE}.created_at as timestamp) ;;
}

  dimension_group: date_between_plus_created{
    type: duration
    sql_start: cast(${TABLE}.plus_created_at as timestamp);;
    sql_end: cast(${TABLE}.created_at as timestamp);;
  }


set: detail {
  fields: [plus_created_at_time, email, customer_verify, created_at_time]
}
}
