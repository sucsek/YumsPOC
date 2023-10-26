connection: "pizzahutpoc"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: yumpoc_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: yumpoc_default_datagroup

explore: flashreport1 {}

explore: comboreport1 {}
