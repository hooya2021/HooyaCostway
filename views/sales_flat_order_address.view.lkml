view: sales_flat_order_address {
  sql_table_name: `costway_com.sales_flat_order_address`
    ;;

  dimension: address_type {
    type: string
    sql: ${TABLE}.address_type ;;
  }

  dimension: avatax_quote_address_id {
    type: number
    sql: ${TABLE}.avatax_quote_address_id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    drill_fields: [sales_flat_order_item.name]
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: country_id {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country_id ;;
    drill_fields: [region,city]
  }

  dimension: customer_address_id {
    type: number
    sql: ${TABLE}.customer_address_id ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: entity_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.entity_id ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension: firstname {
    type: string
    sql: ${TABLE}.firstname ;;
  }

  dimension: hostname {
    type: string
    sql: ${TABLE}.hostname ;;
  }

  dimension: lastname {
    type: string
    sql: ${TABLE}.lastname ;;
  }

  dimension: middlename {
    type: string
    sql: ${TABLE}.middlename ;;
  }


  dimension: parent_id {
    type: number
    sql: ${TABLE}.parent_id ;;
  }

  dimension: postcode {
    type: string
    sql: ${TABLE}.postcode ;;
  }

  dimension: prefix {
    type: string
    sql: ${TABLE}.prefix ;;
  }

  dimension: quote_address_id {
    type: number
    sql: ${TABLE}.quote_address_id ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
    map_layer_name: us_states
    drill_fields: [city]
  }

  dimension: region_id {
    type: number
    sql: ${TABLE}.region_id ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }

  dimension: suffix {
    type: string
    sql: ${TABLE}.suffix ;;
  }

  dimension: telephone {
    type: string
    sql: ${TABLE}.telephone ;;
  }

  dimension: vat_id {
    type: string
    sql: ${TABLE}.vat_id ;;
  }

  dimension: vat_is_valid {
    type: number
    value_format_name: id
    sql: ${TABLE}.vat_is_valid ;;
  }

  dimension: vat_request_date {
    type: string
    sql: ${TABLE}.vat_request_date ;;
  }

  dimension: vat_request_id {
    type: string
    sql: ${TABLE}.vat_request_id ;;
  }

  dimension: vat_request_success {
    type: number
    sql: ${TABLE}.vat_request_success ;;
  }

  measure: count {
    type: count
    drill_fields: [firstname, hostname, middlename, lastname]
  }
}
