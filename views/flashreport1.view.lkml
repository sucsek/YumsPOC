view: flashreport1 {
  sql_table_name: `YPoc_View.flashreport1` ;;

  dimension: actual_name {
    type: string
    sql: ${TABLE}.ActualName ;;
  }
  dimension_group: business {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.business ;;
  }
  dimension: latitude {
    type: string
    sql: ${TABLE}.latitude ;;
  }
  dimension: longitude {
    type: string
    sql: ${TABLE}.longitude ;;
  }
  ############
  #Coodinator#
  ############
  dimension: location {
    type: location
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude: ${TABLE}.longitude ;;
  }
  dimension: mtd_actual {
    type: number
    sql: ${TABLE}.MTD_Actual ;;
  }
  dimension: store_code {
    type: number
    sql: ${TABLE}.storeCode ;;
  }
  dimension: storefullname {
    type: string
    sql: ${TABLE}.storefullname ;;
  }
  dimension: storename {
    type: string
    sql: ${TABLE}.storename ;;
  }
  dimension: today_actual {
    type: number
    sql: ${TABLE}.Today_Actual ;;
  }
  measure: count {
    type: count
    drill_fields: [storefullname, actual_name, storename]
  }
  ##########################
  #Custom X Axis Order Type#
  ##########################
  dimension: custom_sort_column {
    type: number
    sql: CASE
          WHEN ${actual_name} = 'dinein' THEN 1
          WHEN ${actual_name} = 'delivery' THEN 2
          WHEN ${actual_name} = 'takeaway' THEN 3
          WHEN ${actual_name} = 'catering' THEN 4
          ELSE 5
        END ;;
    hidden: no
  }

########################
#System Net Sales Daily#
########################
  measure: system_net_sales_daily{
    type: sum
    #sql_distinct_key: ${store_code};;
    sql: ${today_actual} ;;
    value_format: "S$#,##0.00"
    drill_fields: [storefullname,actual_name,today_actual]
  }
######################
#System Net Sales MTD#
######################
  measure: system_net_sales_mtd{
    type: sum
    sql_distinct_key: ${store_code};;
    sql: ${mtd_actual} ;;
    value_format: "S$#,##0.00"
  }

########################
#SingDollor Daily Total#
########################
  measure: total_system_sales_daily{
    type: sum
    sql_distinct_key: ${actual_name};;
    sql: ${today_actual} ;;
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
    drill_fields: [storefullname,actual_name,today_actual]
  }

######################
#SingDollor MTD Total#
######################
  measure: total_system_sales_mtd{
    type: sum
    sql_distinct_key: ${actual_name};;
    sql: ${mtd_actual} ;;
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
  }

########################
#Daily Flash Title Date#
########################
  measure: dfr_title{
    type: string
    sql: CONCAT('Daily Flash Report for ',${business_date}) ;;
    html:
    <p style="font-size:30px; text-align:center; line-height:80%;"><i>Pizza Hut Singapore Pte Ltd</i></p>
    <p style="font-size:30px; text-align:center; line-height:80%;">-----------------------------------------------------------------------------------------------------------------------------</p>
    <p style="font-size:20px; text-align:center; line-height:80%;">{{ rendered_value }}</p>
    ;;
  }

##########################
#Monthly Flash Title Date#
##########################
  measure: mfr_title{
    type: string
    sql: CONCAT('Monthly Flash Report for ',${business_month}) ;;
    html:
    <p style="font-size:30px; text-align:center; line-height:80%;"><i>Pizza Hut Singapore Pte Ltd</i></p>
    <p style="font-size:30px; text-align:center; line-height:80%;">-----------------------------------------------------------------------------------------------------------------------------</p>
    <p style="font-size:20px; text-align:center; line-height:80%;">{{ rendered_value }}</p>
    ;;
  }
}
