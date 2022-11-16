view: customer_entity {
  sql_table_name: `costway_com.customer_entity`
    ;;

  dimension: attribute_set_id {
    type: number
    sql: ${TABLE}.attribute_set_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      hour_of_day,
      date,
      week,
      month,
      quarter,
      fiscal_quarter_of_year,
      quarter_of_year,
      fiscal_month_num,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: created_at {
    type: date_time
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: plus_exp_date {
    type: time
    timeframes: [
      raw,
      time,
      hour_of_day,
      date,
      week,
      month,
      quarter,
      fiscal_quarter_of_year,
      quarter_of_year,
      fiscal_month_num,
      year
    ]
    sql: cast(${TABLE}.plus_exp_date as timestamp);;
  }

  dimension: plus_no {
    type: string
    sql: ${TABLE}.plus_no ;;
  }

  dimension: customer_phone {
    type: string
    sql: ${TABLE}.customer_phone ;;
  }

  dimension: disable_auto_group_change {
    type: number
    sql: ${TABLE}.disable_auto_group_change ;;
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

  dimension: entity_type_id {
    type: number
    sql: ${TABLE}.entity_type_id ;;
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}.group_id ;;
  }

  dimension: hostname {
    type: string
    sql: ${TABLE}.hostname ;;
  }

  dimension: increment_id {
    type: string
    sql: ${TABLE}.increment_id ;;
  }

  dimension: interest {
    type: string
    sql: ${TABLE}.interest ;;
  }

  dimension: is_active {
    type: number
    sql: ${TABLE}.is_active ;;
  }

  dimension: is_first {
    type: number
    sql: ${TABLE}.is_first ;;
  }

  dimension: store_id {
    type: number
    sql: ${TABLE}.store_id ;;
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension: website_id {
    type: number
    sql: ${TABLE}.website_id ;;
  }


  measure: registered_user {
    type: count
  }

  dimension: customer_verify {
    type: number
    sql: ${TABLE}.customer_verify ;;
  }

  dimension: customer_verify_code {
    case: {
      when: {
        sql: ${TABLE}.customer_verify=1 ;;
        label: "老用户未验证"
      }
      when: {
        sql: ${TABLE}.customer_verify=2 ;;
        label: "新用户未验证"
      }
      when: {
        sql: ${TABLE}.customer_verify=3 ;;
        label: "新(老)用户验证通过"
      }
      else: "其他"
    }
    type: string
    sql: ${TABLE}.customer_verify ;;
  }

  dimension: phone_verify {
    type: number
    sql: ${TABLE}.phone_verify ;;
  }

  dimension: phone_verify_code {
    case: {
      when: {
        sql: ${TABLE}.phone_verify=0 ;;
        label: "手机号未验证"
      }
      when: {
        sql: ${TABLE}.phone_verify =1 ;;
        label: "手机号已验证"
      }
      else: "其他"
    }
  }
}
