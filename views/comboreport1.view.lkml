view: comboreport1 {
  sql_table_name: `pizzahutpoc.YPoc_View.comboreport1` ;;

  dimension_group: first_business {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FirstBusinessDate ;;
  }
  dimension: itemtype {
    type: string
    sql: ${TABLE}.Itemtype ;;
  }
  dimension: menu_item_master_name1 {
    type: string
    sql: ${TABLE}.MenuItemMasterName1 ;;
  }
  dimension: menu_item_master_number {
    type: number
    sql: ${TABLE}.MenuItemMasterNumber ;;
  }
  dimension: sale_count {
    type: number
    sql: ${TABLE}.Sale_count ;;
  }
  dimension: sale_total {
    type: number
    sql: ${TABLE}.Sale_total ;;
  }
  dimension: store_name {
    type: string
    sql: ${TABLE}.StoreName ;;
  }
  dimension: store_number {
    type: string
    sql: ${TABLE}.StoreNumber ;;
  }
  dimension: storefullname {
    type: string
    sql: ${TABLE}.storefullname ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}.Title ;;
  }
  measure: count {
    type: count
    drill_fields: [storefullname, store_name]
  }
  ##############
  #Sum of Count#
  ##############
  measure: total_count{
    type: sum
    sql_distinct_key: ${menu_item_master_name1};;
    sql: ${sale_count} ;;
  }

  ##############
  #Sum of Sales#
  ##############
  measure: total_sales{
    type: sum
    sql_distinct_key: ${menu_item_master_name1};;
    sql: ${sale_total} ;;
    value_format: "S$#,##0.00"
  }

  #######
  #Title#
  #######
  measure: title_date{
    type: string
    sql: CONCAT('Combo Report',${title}) ;;
    html:
    <p style="font-size:30px; text-align:center; line-height:80%;"><i>Pizza Hut Singapore Pte Ltd</i></p>
    <p style="font-size:30px; text-align:center; line-height:80%;">-----------------------------------------------------------------------------------------------------------------------------</p>
    <p style="font-size:20px; text-align:center; line-height:80%;">{{ rendered_value }}</p>
    ;;
  }
}
