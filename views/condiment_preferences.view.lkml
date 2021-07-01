# The name of this view in Looker is "Condiment Preferences"
view: condiment_preferences {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: dbo.condiment_preferences ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Condiment" in Explore.

  dimension: condiment {
    type: string
    sql: ${TABLE}.condiment ;;
  }

  dimension: is_condiment {
    type: string
    sql: ${TABLE}.is_condiment ;;
  }

  dimension: is_holy_trinity_kmr {
    type: string
    sql: ${TABLE}."is_holy_trinity K/M/R" ;;
  }

  dimension: is_mayo_product {
    type: string
    sql: ${TABLE}.is_mayo_product ;;
  }

  dimension: is_spicy {
    type: string
    sql: ${TABLE}.is_spicy ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [name]
  }
}

# These sum and average measures are hidden by default.
# If you want them to show up in your explore, remove hidden: yes.
