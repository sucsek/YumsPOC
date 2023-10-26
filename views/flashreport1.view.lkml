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
}
