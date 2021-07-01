# The name of this view in Looker is "Order Items"
view: order_items {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: dbo.ORDER_ITEMS ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Amount" in Explore.

  dimension: amount {
    type: number
    sql: ${TABLE}.AMOUNT ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ORDER_ID ;;
  }

  dimension: sku_num {
    type: number
    sql: ${TABLE}.SKU_NUM ;;
  }

  dimension: test_varchar_a {
    type: string
    sql: ${TABLE}.test_varchar_a ;;
  }

  dimension: test_varcharmax_adina {
    type: string
    sql: ${TABLE}.test_varcharmax_adina ;;
  }

  dimension: var_test {
    type: string
    sql: ${TABLE}.var_test ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [id, name, orders.id]
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_amount {
    type: sum
    hidden: yes
    sql: ${amount} ;;
  }

  measure: average_amount {
    type: average
    hidden: yes
    sql: ${amount} ;;
  }

  measure: total_sku_num {
    type: sum
    hidden: yes
    sql: ${sku_num} ;;
  }

  measure: average_sku_num {
    type: average
    hidden: yes
    sql: ${sku_num} ;;
  }
}
