# Define the database connection to be used for this model.
connection: "mssql_2008"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: mssql_server_repro_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: mssql_server_repro_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Mssql Server Repro"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: all_types {}

explore: condiment_preferences {}

explore: datetest {}

explore: make_up_my_own_name {
  join: users {
    type: left_outer
    sql_on: ${make_up_my_own_name.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: orders2 {
  join: users {
    type: left_outer
    sql_on: ${orders2.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: pegdatetest {}

explore: sum_users {
  join: users {
    type: left_outer
    sql_on: ${sum_users.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: t12 {}

explore: temp {
  join: users {
    type: left_outer
    sql_on: ${temp.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: test {
  join: orders {
    type: left_outer
    sql_on: ${test.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: test1 {
  join: orders {
    type: left_outer
    sql_on: ${test1.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: users {}
