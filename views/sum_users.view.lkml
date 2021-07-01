# The name of this view in Looker is "Sum Users"
view: sum_users {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: dbo.sum_users ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Days As Customer" in Explore.

  dimension: days_as_customer {
    type: number
    sql: ${TABLE}.days_as_customer ;;
  }

  dimension: lifetime_order_amount {
    type: number
    sql: ${TABLE}.lifetime_order_amount ;;
  }

  dimension: lifetime_orders {
    type: number
    sql: ${TABLE}.lifetime_orders ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: week_count {
    type: number
    sql: ${TABLE}.week_count ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [users.id, users.name]
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_days_as_customer {
    type: sum
    hidden: yes
    sql: ${days_as_customer} ;;
  }

  measure: average_days_as_customer {
    type: average
    hidden: yes
    sql: ${days_as_customer} ;;
  }

  measure: total_lifetime_order_amount {
    type: sum
    hidden: yes
    sql: ${lifetime_order_amount} ;;
  }

  measure: average_lifetime_order_amount {
    type: average
    hidden: yes
    sql: ${lifetime_order_amount} ;;
  }

  measure: total_lifetime_orders {
    type: sum
    hidden: yes
    sql: ${lifetime_orders} ;;
  }

  measure: average_lifetime_orders {
    type: average
    hidden: yes
    sql: ${lifetime_orders} ;;
  }

  measure: total_week_count {
    type: sum
    hidden: yes
    sql: ${week_count} ;;
  }

  measure: average_week_count {
    type: average
    hidden: yes
    sql: ${week_count} ;;
  }
}
