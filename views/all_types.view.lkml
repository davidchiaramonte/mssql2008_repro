# The name of this view in Looker is "All Types"
view: all_types {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: dbo.ALL_TYPES ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "This Float" in Explore.

  dimension: this_float {
    type: number
    sql: ${TABLE}.THIS_FLOAT ;;
  }

  dimension: this_int {
    type: number
    sql: ${TABLE}.THIS_INT ;;
  }

  dimension: this_string {
    type: string
    sql: ${TABLE}.THIS_STRING ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: []
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_this_float {
    type: sum
    hidden: yes
    sql: ${this_float} ;;
  }

  measure: average_this_float {
    type: average
    hidden: yes
    sql: ${this_float} ;;
  }

  measure: total_this_int {
    type: sum
    hidden: yes
    sql: ${this_int} ;;
  }

  measure: average_this_int {
    type: average
    hidden: yes
    sql: ${this_int} ;;
  }
}
