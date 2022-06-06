view: customer_plus_order {
  sql_table_name: `alidbtogcp.costway_com.customer_plus_order`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: callback_code {
    type: string
    sql: ${TABLE}.callback_code ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.created_at ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: holder_name {
    type: string
    sql: ${TABLE}.holderName ;;
  }

  dimension: house_number_or_name {
    type: string
    sql: ${TABLE}.houseNumberOrName ;;
  }

  dimension: is_job_exec {
    type: number
    sql: ${TABLE}.is_job_exec ;;
  }

  dimension: is_like_succ {
    type: number
    sql: ${TABLE}.is_like_succ ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: order_sn {
    type: string
    sql: ${TABLE}.order_sn ;;
  }

  dimension: payinfo {
    type: string
    sql: ${TABLE}.payinfo ;;
  }

  dimension: paymethod {
    type: string
    sql: ${TABLE}.paymethod ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postalCode ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: state_or_province {
    type: string
    sql: ${TABLE}.stateOrProvince ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }

  dimension: type_id {
    type: number
    sql: ${TABLE}.type_id ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, holder_name, house_number_or_name, name]
  }
}
