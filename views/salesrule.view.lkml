view: salesrule {
  sql_table_name: `costway_com.salesrule`
    ;;

  dimension: actions_serialized {
    type: string
    sql: ${TABLE}.actions_serialized ;;
  }

  dimension: apply_to_shipping {
    type: number
    sql: ${TABLE}.apply_to_shipping ;;
  }

  dimension: conditions_serialized {
    type: string
    sql: ${TABLE}.conditions_serialized ;;
  }

  dimension: coupon_type {
    type: number
    sql: ${TABLE}.coupon_type ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: discount_amount {
    type: number
    sql: ${TABLE}.discount_amount ;;
  }

  dimension: discount_qty {
    type: number
    sql: ${TABLE}.discount_qty ;;
  }

  dimension: discount_step {
    type: number
    sql: ${TABLE}.discount_step ;;
  }

  dimension_group: from {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.from_date ;;
  }

  dimension: hostname {
    type: string
    sql: ${TABLE}.hostname ;;
  }

  dimension: identifier {
    type: string
    sql: ${TABLE}.identifier ;;
  }

  dimension: is_active {
    type: number
    sql: ${TABLE}.is_active ;;
  }

  dimension: is_advanced {
    type: number
    sql: ${TABLE}.is_advanced ;;
  }

  dimension: is_rss {
    type: number
    sql: ${TABLE}.is_rss ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: product_ids {
    type: string
    sql: ${TABLE}.product_ids ;;
  }

  dimension: rule_id {
    type: number
    sql: ${TABLE}.rule_id ;;
  }

  dimension: simple_action {
    type: string
    sql: ${TABLE}.simple_action ;;
  }

  dimension: simple_free_shipping {
    type: number
    sql: ${TABLE}.simple_free_shipping ;;
  }

  dimension: sort_order {
    type: number
    sql: ${TABLE}.sort_order ;;
  }

  dimension: stop_rules_processing {
    type: number
    sql: ${TABLE}.stop_rules_processing ;;
  }

  dimension: times_used {
    type: number
    sql: ${TABLE}.times_used ;;
  }

  dimension_group: to {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.to_date ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension: use_auto_generation {
    type: number
    sql: ${TABLE}.use_auto_generation ;;
  }

  dimension: uses_per_coupon {
    type: number
    sql: ${TABLE}.uses_per_coupon ;;
  }

  dimension: uses_per_customer {
    type: number
    sql: ${TABLE}.uses_per_customer ;;
  }

  dimension: coupon_attribute {
    type: number
    sql: ${TABLE}.coupon_attribute ;;
  }
  dimension: coupon_attribute_name {
     case: {
       when: {
         sql: ${TABLE}.coupon_attribute = 1 ;;
        label: "Deal Site"
       }
      when: {
        sql: ${TABLE}.coupon_attribute = 2 ;;
        label: "Sitewide"
      }
      when: {
        sql: ${TABLE}.coupon_attribute = 3;;
        label: "Dropship"
      }
      when: {
        sql: ${TABLE}.coupon_attribute = 4 ;;
        label: "Large Order"
      }
      when: {
        sql: ${TABLE}.coupon_attribute=5 ;;
        label: "Service"
      }
      when: {
        sql: ${TABLE}.coupon_attribute=6 ;;
        label: "Newsletter"
      }
      when: {
        sql: ${TABLE}.coupon_attribute=7 ;;
        label: "Register"
      }
      when: {
        sql: ${TABLE}.coupon_attribute=8;;
        label: "Publisher"
      }
      when: {
        sql: ${TABLE}.coupon_attribute=9 ;;
        label: "Social Media"
      }
      when: {
        sql: ${TABLE}.coupon_attribute=10 ;;
        label: "Offline"
      }
      when: {
        sql: ${TABLE}.coupon_attribute=11;;
        label: "Packaged Coupon"
      }
      when: {
        sql: ${TABLE}.coupon_attribute=12 ;;
        label: "Test Coupon"
      }
      when: {
        sql: ${TABLE}.coupon_attribute=13 ;;
        label: "Birthday Coupon"
      }
      when: {
        sql: ${TABLE}.coupon_attribute=14 ;;
        label: "Questionnaire"
      }
      when: {
        sql: ${TABLE}.coupon_attribute=15 ;;
        label: "App Coupon"
      }
      when: {
        sql: ${TABLE}.coupon_attribute=16 ;;
        label: "TK Living"
      }
      when: {
        sql: ${TABLE}.coupon_attribute=17 ;;
        label: "Share Coupon"
      }
      else: "Other"
     }
     type: string
    sql: ${TABLE}.coupon_attribute ;;
    }

  measure: count {
    type: count
    drill_fields: [hostname, name]
  }
}
