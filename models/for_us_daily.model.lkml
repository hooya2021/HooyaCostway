connection: "for_us_daily"

include: "/views/*.view.lkml"

datagroup: for_us_daily_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: for_us_daily_datagroup

explore: google_sheet_session {}
