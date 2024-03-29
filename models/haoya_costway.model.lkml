connection: "haoya_bq"
# connection: "for_us_daily"

# include all the views
include: "/views/**/*.view"

datagroup: haoya_costway_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: haoya_costway_default_datagroup

explore: admin_role {}

explore: admin_rule {}

explore: admin_user {}

explore: adminnotification_inbox {}

explore: api2_acl_role {}

explore: api_role {}

explore: api_rule {}

explore: api_session {}

explore: api_user {}

explore: aw_afp_blocks {}

explore: aw_afp_productimages {}

explore: aw_core_logger {}

explore: aw_points_assignment {}

explore: aw_points_dropship {}

explore: aw_points_exchange_order {}

explore: aw_points_exchange_product {}

explore: aw_points_invitation {}

explore: aw_points_rate {}

explore: aw_points_rule {}

explore: aw_points_sign {}

explore: aw_points_summary {}

explore: aw_points_transaction {}

explore: aw_points_transaction_orderspend {}

explore: aw_points_warn_email {}

explore: aw_share_product {}

explore: aw_share_product_log {}

explore: bannerslider_banner {}

explore: bannerslider_report {}

explore: bannerslider_slider {}

explore: catalog_category_entity {}

explore: catalog_category_entity_datetime {}

explore: catalog_category_entity_decimal {}

explore: catalog_category_entity_int {}

explore: catalog_category_entity_text {}

explore: catalog_category_entity_varchar {}

explore: catalog_category_flat_store_1 {}

explore: catalog_category_product {}

explore: catalog_category_product_index {}

explore: catalog_eav_attribute {}

explore: catalog_product_entity {
  join: catalog_product_entity_int {
    relationship: one_to_one
    sql_on: ${catalog_product_entity.entity_id} = ${catalog_product_entity_int.entity_id} ;;
  }
  join: catalog_product_entity_int_1 {
    from: catalog_product_entity_int
    relationship: one_to_one
    sql_on: ${catalog_product_entity.entity_id} = ${catalog_product_entity_int_1.entity_id} ;;
  }
  join: cataloginventory_stock_item{
    relationship: one_to_one
    sql_on: ${catalog_product_entity.entity_id} = ${cataloginventory_stock_item.product_id} ;;
  }

}

explore: catalog_product_entity_datetime {}

explore: catalog_product_entity_decimal {}

explore: catalog_product_entity_group_price {
  join: customer_group {
    type: left_outer
    sql_on: ${catalog_product_entity_group_price.customer_group_id} = ${customer_group.customer_group_id} ;;
    relationship: many_to_one
  }
}

explore: catalog_product_entity_int {}

explore: catalog_product_entity_media_gallery {}

explore: catalog_product_entity_media_gallery_value {}

explore: catalog_product_entity_point_price {
  join: customer_group {
    type: left_outer
    sql_on: ${catalog_product_entity_point_price.customer_group_id} = ${customer_group.customer_group_id} ;;
    relationship: many_to_one
  }
}

explore: catalog_product_entity_text {}

explore: catalog_product_entity_tier_price {
  join: customer_group {
    type: left_outer
    sql_on: ${catalog_product_entity_tier_price.customer_group_id} = ${customer_group.customer_group_id} ;;
    relationship: many_to_one
  }
}

explore: catalog_product_entity_varchar {}

explore: catalog_product_fee {}

explore: catalog_product_flat_1 {}

explore: catalog_product_index_eav {}

explore: catalog_product_index_eav_idx {}

explore: catalog_product_index_eav_tmp {}

explore: catalog_product_index_price {
  join: customer_group {
    type: left_outer
    sql_on: ${catalog_product_index_price.customer_group_id} = ${customer_group.customer_group_id} ;;
    relationship: many_to_one
  }
}

explore: catalog_product_index_price_bundle_tmp {
  join: customer_group {
    type: left_outer
    sql_on: ${catalog_product_index_price_bundle_tmp.customer_group_id} = ${customer_group.customer_group_id} ;;
    relationship: many_to_one
  }
}

explore: catalog_product_index_price_idx {
  join: customer_group {
    type: left_outer
    sql_on: ${catalog_product_index_price_idx.customer_group_id} = ${customer_group.customer_group_id} ;;
    relationship: many_to_one
  }
}

explore: catalog_product_index_price_tmp {
  join: customer_group {
    type: left_outer
    sql_on: ${catalog_product_index_price_tmp.customer_group_id} = ${customer_group.customer_group_id} ;;
    relationship: many_to_one
  }
}

explore: catalog_product_index_website {}

explore: catalog_product_link {}

explore: catalog_product_link_attribute {}

explore: catalog_product_link_attribute_int {}

explore: catalog_product_link_type {}

explore: catalog_product_relation {}

explore: catalog_product_super_attribute {}

explore: catalog_product_super_attribute_label {}

explore: catalog_product_super_attribute_pricing {}

explore: catalog_product_super_link {}

explore: catalog_product_website {}

explore: cataloginventory_stock {}

explore: cataloginventory_stock_item {}

explore: cataloginventory_stock_status {}

explore: cataloginventory_stock_status_idx {}

explore: catalogsearch_fulltext {}

explore: catalogsearch_query {}

explore: check_credit_transaction {}

explore: check_order_info {}

explore: cms_block {}

explore: cms_block_store {}

explore: cms_page {}

explore: cms_page_store {}

explore: core_cache_option {}

explore: core_config_data {}

explore: core_email_template {}

explore: core_flag {}

explore: core_resource {}

explore: core_store {}

explore: core_store_group {}

explore: core_url_rewrite {}

explore: core_variable {}

explore: core_variable_value {}

explore: core_website {}

explore: coupon_aggregated {}

explore: coupon_aggregated_updated {}

explore: cron_schedule {}

explore: customer_address_entity {}

explore: customer_address_entity_int {}

explore: customer_address_entity_text {}

explore: customer_address_entity_varchar {}

explore: customer_eav_attribute {}

explore: customer_entity {
  join: customer_register_source {
    sql_on: ${customer_entity.entity_id} = ${customer_register_source.customer_id} ;;
    relationship: one_to_one
  }
  join: customer_group {
    sql_on: ${customer_entity.group_id} = ${customer_group.customer_group_id} ;;
    relationship: one_to_one
  }
  join: newsletter_subscriber {
    sql_on: ${customer_entity.entity_id} = ${newsletter_subscriber.customer_id} ;;
    relationship: one_to_one
  }
  join: sales_flat_order {
    sql_on: ${customer_entity.email} = ${sales_flat_order.customer_email} ;;
    relationship: one_to_one
  }
  join: twilio_sms {
    sql_on: ${customer_entity.entity_id} = ${twilio_sms.customer_id} ;;
    relationship: one_to_one
  }
  join: sales_flat_order_address {
    relationship: one_to_one
    sql_on: ${sales_flat_order.shipping_address_id} = ${sales_flat_order_address.entity_id} ;;
  }
}


explore: customer_entity_datetime {}

explore: customer_entity_int {}

explore: customer_entity_varchar {}

explore: customer_feedback {}

explore: customer_form_attribute {}

explore: customer_group {}

explore: customer_register_ip {}

explore: customer_register_source {}

explore: customer_subreg {}

explore: customer_wholesale {}

explore: dataflow_profile {}

explore: dataflow_profile_history {}

explore: design_change {}

explore: directory_country {}

explore: directory_country_region {}

explore: directory_country_region_name {}

explore: directory_currency_rate {}

explore: eav_attribute {}

explore: eav_attribute_group {}

explore: eav_attribute_label {}

explore: eav_attribute_option {}

explore: eav_attribute_option_value {}

explore: eav_attribute_set {}

explore: eav_entity_attribute {}

explore: eav_entity_store {}

explore: eav_entity_type {}

explore: eav_form_element {}

explore: eav_form_fieldset {}

explore: eav_form_fieldset_label {}

explore: eav_form_type {}

explore: eav_form_type_entity {}

explore: enterprise_logging_event {}

explore: enterprise_logging_event_changes {}

explore: faq_helpful {}

explore: faq_list {}

explore: hooya_blacklist_record {}

explore: hooya_hotkeyword_list {}

explore: hooya_vote_activity {}

explore: hooya_vote_record {}

explore: importexport_importdata {}

explore: index_event {}

explore: index_process {}

explore: index_process_event {}

explore: ipsecurity_log {}

explore: log_customer {
  join: customer_entity {
    sql_on: ${log_customer.customer_id}= ${customer_entity.entity_id} ;;
    relationship: one_to_one
  }
  join: customer_register_source {
    sql_on: ${customer_register_source.customer_id} = ${customer_entity.entity_id} ;;
    relationship: one_to_one
  }
}

explore: log_quote {}

explore: log_url {}

explore: log_url_info {}

explore: log_visitor {}

explore: log_visitor_info {}

explore: log_visitor_online {}

explore: m_feedexport_custom_attribute {}

explore: m_feedexport_feed {}

explore: m_feedexport_feed_history {}

explore: m_feedexport_feed_product {}

explore: m_feedexport_mapping_category {}

explore: m_feedexport_performance_aggregated {}

explore: m_feedexport_performance_click {}

explore: m_feedexport_performance_order {}

explore: m_feedexport_rule {}

explore: m_feedexport_rule_feed {}

explore: m_feedexport_rule_product {}

explore: m_feedexport_template {}

explore: newsletter_problem {}

explore: newsletter_queue {}

explore: newsletter_queue_link {}

explore: newsletter_queue_store_link {}

explore: newsletter_subscriber {
  join: sales_flat_order {
    sql_on: ${newsletter_subscriber.customer_id} = ${sales_flat_order.customer_id} ;;
    relationship: one_to_one
  }
  join: customer_entity {
    sql_on:  ${newsletter_subscriber.subscriber_email} =  ${customer_entity.email};;
    relationship: one_to_one
  }
  join: customer_group {
    relationship: one_to_one
    sql_on: ${customer_entity.group_id}=${customer_group.customer_group_id} ;;
  }
  join: sales_flat_order_source {
    relationship: one_to_one
    sql_on: ${sales_flat_order.entity_id} = ${sales_flat_order_source.order_id} ;;
  }
  join: salesrule_coupon {
    relationship: one_to_one
    sql_on: upper(${sales_flat_order.coupon_code}) = upper(${salesrule_coupon.code} );;
  }
  join: salesrule {
    relationship: one_to_many
    sql_on: ${salesrule_coupon.rule_id}= ${salesrule.rule_id};;
  }
}

explore: newsletter_subscriber_info {}

explore: newsletter_template {}

explore: op_avatax_log {}

explore: op_avatax_queue {}

explore: overstock_tmp {}

explore: order_join_ga {
  from: sql_runner_query
}

explore: permission_block {}

explore: permission_variable {}

explore: plumbase_product {}

explore: plumrocket_sociallogin_account {}

explore: poll {}

explore: poll_answer {
  join: poll {
    type: left_outer
    sql_on: ${poll_answer.poll_id} = ${poll.poll_id} ;;
    relationship: many_to_one
  }
}

explore: poll_store {
  join: poll {
    type: left_outer
    sql_on: ${poll_store.poll_id} = ${poll.poll_id} ;;
    relationship: many_to_one
  }
}

explore: product_visit_config {}

explore: rating {}

explore: rating_entity {}

explore: rating_option {
  join: rating {
    type: left_outer
    sql_on: ${rating_option.rating_id} = ${rating.rating_id} ;;
    relationship: many_to_one
  }
}

explore: rating_option_vote {
  join: review {
    type: left_outer
    sql_on: ${rating_option_vote.review_id} = ${review.review_id} ;;
    relationship: many_to_one
  }

  join: rating {
    type: left_outer
    sql_on: ${rating_option_vote.rating_id} = ${rating.rating_id} ;;
    relationship: many_to_one
  }
}

explore: rating_option_vote_aggregated {
  join: rating {
    type: left_outer
    sql_on: ${rating_option_vote_aggregated.rating_id} = ${rating.rating_id} ;;
    relationship: many_to_one
  }
}

explore: rating_store {
  join: rating {
    type: left_outer
    sql_on: ${rating_store.rating_id} = ${rating.rating_id} ;;
    relationship: many_to_one
  }
}

explore: referral_child {}

explore: referral_link {}

explore: report_event {}

explore: report_event_types {}

explore: report_viewed_product_index {}

explore: review {}

explore: review_detail {
  join: review {
    type: left_outer
    sql_on: ${review_detail.review_id} = ${review.review_id} ;;
    relationship: many_to_one
  }
}

explore: review_entity {}

explore: review_entity_summary {}

explore: review_helpful {}

explore: review_image {
  join: review {
    type: left_outer
    sql_on: ${review_image.review_id} = ${review.review_id} ;;
    relationship: many_to_one
  }
}

explore: review_status {}

explore: review_store {
  join: review {
    type: left_outer
    sql_on: ${review_store.review_id} = ${review.review_id} ;;
    relationship: many_to_one
  }
}

explore: riskified_full_declination_authorizenet {}

explore: riskified_full_declination_sent {}

explore: riskified_full_historical_sent {}

explore: room_block {}

explore: room_block_product {}

explore: room_category {}

explore: room_style {}

explore: rpc_banner {}

explore: rpc_quote_equipment {}

explore: rpc_rule_equipment {}

explore: rpc_uuid_relation {}

explore: sales_bestsellers_aggregated_daily {}

explore: sales_bestsellers_aggregated_monthly {}

explore: sales_bestsellers_aggregated_yearly {}

explore: sales_flat_creditmemo {}

explore: sales_flat_creditmemo_comment {}

explore: sales_flat_creditmemo_grid {}

explore: sales_flat_creditmemo_item {}

explore: sales_flat_invoice {}

explore: sales_flat_invoice_comment {}

explore: sales_flat_invoice_grid {}

explore: sales_flat_invoice_item {}

explore: sales_flat_order {
  join: customer_entity {
    relationship: one_to_one
    sql_on: ${sales_flat_order.customer_email_transfer} = ${customer_entity.email_transfer} ;;
  }
  join: customer_group {
    relationship: one_to_one
    sql_on: ${customer_entity.group_id}=${customer_group.customer_group_id} ;;
  }
  join: customer_total_order_num {
    relationship: one_to_one
    sql_on: ${sales_flat_order.customer_email_transfer} = ${customer_total_order_num.customer_email_transfer} ;;
  }
  join: customer_register_source {
    sql_on: ${customer_entity.entity_id} = ${customer_register_source.customer_id} ;;
    relationship: one_to_one
  }
  join: sales_flat_order_address {
    relationship: one_to_one
    sql_on: ${sales_flat_order.shipping_address_id} = ${sales_flat_order_address.entity_id} ;;
  }
  join: sales_flat_order_item {
    relationship: one_to_many
    sql_on: ${sales_flat_order.entity_id} = ${sales_flat_order_item.order_id} ;;
  }
  join: sku_category {
    relationship: one_to_one
    sql_on: ${sales_flat_order_item.sku} = ${sku_category.sku} ;;
  }
  join: sales_flat_order_source {
    relationship: one_to_one
    sql_on: ${sales_flat_order.entity_id} = ${sales_flat_order_source.order_id} ;;
  }
  join: sales_flat_order_payment {
    relationship: one_to_one
    sql_on: ${sales_flat_order.entity_id} = ${sales_flat_order_payment.parent_id} ;;
  }
  join: customer_group_order {
    from: customer_group
    relationship: one_to_one
    sql_on: ${sales_flat_order.customer_group_id} = ${customer_group_order.customer_group_id} ;;
  }
  join: sales_flat_quote {
    relationship: one_to_one
    sql_on: ${sales_flat_order.quote_id} = ${sales_flat_quote.entity_id} ;;
  }

  join: salesrule {
    relationship: one_to_many
    sql_on: ${sales_flat_order.applied_rule_ids} = ${salesrule.rule_id};;
  }
  join: customer_retention_analysis {
    relationship: one_to_one
    sql_on: ${sales_flat_order.customer_email_transfer} = ${customer_retention_analysis.customer_email_transfer} ;;
  }
  join: customer_cumulative_sales {
    relationship: one_to_one
    sql_on: ${sales_flat_order.customer_email} = ${customer_cumulative_sales.customer_email};;
  }
  join: newsletter_subscriber {
    relationship: one_to_one
    sql_on: ${sales_flat_order.customer_email} = ${newsletter_subscriber.subscriber_email} ;;
  }
  join:aw_points_transaction_orderspend {
    relationship: one_to_one
    sql_on: ${sales_flat_order.increment_id} = ${aw_points_transaction_orderspend.order_increment_id} ;;
  }

}


explore: sales_flat_order_address {}

explore: sales_flat_order_grid {}

explore: sales_flat_order_item {
  join: sales_flat_order {
    relationship: one_to_one
    sql_on: ${sales_flat_order_item.order_id} = ${sales_flat_order.entity_id};;
  }
}

explore: sales_flat_order_payment {}

explore: sales_flat_order_source {}

explore: sales_flat_order_status_history {
  join: sales_flat_order {
    sql_on: ${sales_flat_order_status_history.parent_id} = ${sales_flat_order.entity_id};;
    relationship: one_to_one
  }
  join: customer_entity {
    sql_on: ${sales_flat_order.customer_email_transfer} = ${customer_entity.email_transfer} ;;
    relationship: one_to_one
  }
  join: customer_group {
    sql_on: ${customer_entity.group_id}=${customer_group.customer_group_id} ;;
    relationship: one_to_one
  }
  join: sales_flat_order_address {
    relationship: one_to_one
    sql_on: ${sales_flat_order.shipping_address_id} = ${sales_flat_order_address.entity_id} ;;
  }
}

explore: sales_flat_quote {
  join: customer_group {
    type: left_outer
    sql_on: ${sales_flat_quote.customer_group_id} = ${customer_group.customer_group_id} ;;
    relationship: many_to_one
  }
  join: sales_flat_quote_item {
    type: left_outer
    sql_on: ${sales_flat_quote.entity_id} = ${sales_flat_quote_item.quote_id} ;;
    relationship: one_to_one
  }
  join: sku_category {
    sql_on: ${sku_category.sku}=${sales_flat_quote_item.sku} ;;
    relationship: one_to_one
  }
  join: customer_entity{
    type: left_outer
    sql_on: ${sales_flat_quote.customer_id} = ${customer_entity.entity_id} ;;
    relationship: one_to_one
  }
  join: sales_flat_order{
    type: left_outer
    sql_on: ${sales_flat_quote.customer_id} = ${sales_flat_order.customer_id} ;;
    relationship: one_to_one
  }
  join: customer_retention_analysis {
    type: left_outer
    sql_on: ${customer_retention_analysis.customer_id} = ${sales_flat_quote.customer_id};;
    relationship: one_to_one
  }
  join: sales_flat_order_address {
    relationship: one_to_one
    sql_on: ${sales_flat_order.shipping_address_id} = ${sales_flat_order_address.entity_id} ;;
  }
}

explore: sales_flat_quote_address {}

explore: sales_flat_quote_item {}

explore: sales_flat_quote_item_option {}

explore: sales_flat_quote_payment {}

explore: sales_flat_quote_product_price_email_record {}

explore: sales_flat_quote_shipping_rate {}

explore: sales_flat_quote_stock_email_record {}

explore: sales_flat_resend {}

explore: sales_flat_shipment {
  join: sales_flat_order {
    relationship: one_to_one
    sql_on: ${sales_flat_shipment.order_id} = ${sales_flat_order.entity_id} ;;
  }
  join: sales_flat_shipment_track {
    relationship: one_to_one
    sql_on: ${sales_flat_shipment.entity_id}=${sales_flat_shipment_track.parent_id} ;;
  }
}


explore: sales_flat_shipment_changelog {}

explore: sales_flat_shipment_comment {}

explore: sales_flat_shipment_grid {}

explore: sales_flat_shipment_item {}

explore: sales_flat_shipment_track {}

explore: sales_invoiced_aggregated {}

explore: sales_invoiced_aggregated_order {}

explore: sales_order_aggregated_created {}

explore: sales_order_aggregated_updated {}

explore: sales_order_status {}

explore: sales_order_status_state {}

explore: sales_order_tax {}

explore: sales_order_tax_item {}

explore: sales_payment_transaction {}

explore: sales_payment_transaction_changelog {}

explore: sales_refunded_aggregated {}

explore: sales_refunded_aggregated_order {}

explore: sales_shipping_aggregated {}

explore: sales_shipping_aggregated_order {}

explore: salesrule {}

explore: salesrule_coupon {
  join: salesrule_customer_coupon {
    sql_on: ${salesrule_coupon.coupon_id} = ${salesrule_customer_coupon.coupon_id} ;;
    relationship: one_to_one
  }
  join: salesrule_customer_sign_coupon {
    sql_on: ${salesrule_coupon.coupon_id} = ${salesrule_customer_sign_coupon.coupon_id} ;;
    relationship: one_to_one
  }
  join: customer_entity {
    sql_on: ${salesrule_customer_sign_coupon.customer_id} = ${customer_entity.entity_id}   ;;
    relationship: one_to_one
  }
}

explore: salesrule_coupon_usage {}

explore: salesrule_customer {}

explore: salesrule_customer_coupon {
  join: customer_entity {
    sql_on: ${salesrule_customer_coupon.customer_id} = ${customer_entity.entity_id} ;;
    relationship: one_to_one
  }
  join: salesrule_coupon {
    sql_on: ${salesrule_coupon.coupon_id} = ${salesrule_customer_coupon.coupon_id} ;;
    relationship: one_to_one
  }
  join: customer_group {
    sql_on: ${customer_entity.group_id} = ${customer_group.customer_group_id} ;;
    relationship: one_to_one
  }
  join: salesrule {
    sql_on: ${salesrule_coupon.rule_id}= ${salesrule.rule_id};;
    relationship: one_to_one
  }
}

explore: salesrule_customer_group {
  join: customer_group {
    type: left_outer
    sql_on: ${salesrule_customer_group.customer_group_id} = ${customer_group.customer_group_id} ;;
    relationship: many_to_one
  }
}

explore: salesrule_customer_sign_coupon {}

explore: salesrule_product_attribute {
  join: customer_group {
    type: left_outer
    sql_on: ${salesrule_product_attribute.customer_group_id} = ${customer_group.customer_group_id} ;;
    relationship: many_to_one
  }
}

explore: salesrule_website {}

explore: sendmail_subscribe_product {}

explore: ship_tmp {}

explore: ship_tmp_copy {}

explore: sitejabber_review {}

explore: sitemap {}

explore: smtppro_email_log {}

explore: tax_calculation {
  join: tax_calculation_rule {
    type: left_outer
    sql_on: ${tax_calculation.tax_calculation_rule_id} = ${tax_calculation_rule.tax_calculation_rule_id} ;;
    relationship: many_to_one
  }

  join: tax_calculation_rate {
    type: left_outer
    sql_on: ${tax_calculation.tax_calculation_rate_id} = ${tax_calculation_rate.tax_calculation_rate_id} ;;
    relationship: many_to_one
  }
}

explore: tax_calculation_rate {}

explore: tax_calculation_rule {}

explore: tax_class {}

explore: tax_order_aggregated_created {}

explore: tax_order_aggregated_updated {}

explore: unallowable_sku {}

explore: walmart_tmp {}

explore: walmart_tmp_new {}

explore: wishlist {}

explore: wishlist_item {
  join: wishlist {
    type: left_outer
    sql_on: ${wishlist_item.wishlist_id} = ${wishlist.wishlist_id} ;;
    relationship: many_to_one
  }
}

explore: wishlist_item_option {
  join: wishlist_item {
    type: left_outer
    sql_on: ${wishlist_item_option.wishlist_item_id} = ${wishlist_item.wishlist_item_id} ;;
    relationship: many_to_one
  }

  join: wishlist {
    type: left_outer
    sql_on: ${wishlist_item.wishlist_id} = ${wishlist.wishlist_id} ;;
    relationship: many_to_one
  }
}

explore: wishlist_item_stock_alert {
  join: wishlist {
    type: left_outer
    sql_on: ${wishlist_item_stock_alert.wishlist_id} = ${wishlist.wishlist_id} ;;
    relationship: many_to_one
  }
}

explore: sku_category {}

explore: zeon_landingpage {}

explore: zeon_landingpage_store {}

explore: customer_retention_analysis {
  join: sales_flat_order {
    sql_on: ${customer_retention_analysis.customer_id}= ${sales_flat_order.customer_id} ;;
    relationship: one_to_many
  }
  join: customer_entity {
    sql_on: ${customer_retention_analysis.customer_id}= ${customer_entity.entity_id} ;;
    relationship: one_to_one
  }
  join: sales_flat_order_source {
    sql_on: ${sales_flat_order.entity_id} = ${sales_flat_order_source.order_id} ;;
    relationship: one_to_one
  }
  join: customer_group {
    sql_on: ${customer_entity.group_id} = ${customer_group.customer_group_id} ;;
    relationship: one_to_one
  }
}
explore: customer_plus_change_record {
  join: customer_entity {
    sql_on: ${customer_plus_change_record.customer_id} = ${customer_entity.entity_id};;
    relationship: one_to_one
  }
  join: customer_plus_order {
    sql_on:  ${customer_plus_change_record.customer_id}= ${customer_plus_order.customer_id} ;;
    relationship: one_to_one
  }
}
explore: customer_plus_order {
  join: customer_entity {
    sql_on: ${customer_entity.entity_id} = ${customer_plus_order.customer_id} ;;
    relationship: one_to_one
    type: left_outer
  }
}
explore: plus_customer {
  join: sales_flat_order {
    sql_on: ${plus_customer.customer_id}=${sales_flat_order.customer_id} ;;
    relationship: one_to_one
  }
  join: customer_plus_order {
    sql_on:  ${plus_customer.customer_id}= ${customer_plus_order.customer_id} ;;
    relationship: one_to_one
  }
  join: customer_entity {
    sql_on:${plus_customer.customer_id} = ${customer_entity.entity_id}  ;;
    relationship: one_to_one
  }
}

explore: sku_sales_rank {}
explore: customer_serial {
  join: sales_flat_order {
    sql_on: ${customer_serial.email} = ${sales_flat_order.customer_email} ;;
    relationship: one_to_one
    type: left_outer
  }
  join: sales_flat_quote {
    sql_on: ${customer_serial.email} = ${sales_flat_quote.customer_email} ;;
    relationship: one_to_one
  }
  join: sales_flat_quote_item {
    sql_on: ${sales_flat_quote.entity_id} = ${sales_flat_quote_item.quote_id} ;;
    relationship: one_to_one
  }
  join: sales_flat_order_item {
    relationship: one_to_many
    sql_on: ${sales_flat_order.entity_id} = ${sales_flat_order_item.order_id} ;;
  }
}

# explore: google_sheet_session {}
