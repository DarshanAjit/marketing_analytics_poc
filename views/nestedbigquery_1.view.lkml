# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: nestedbigquery_1 {
  hidden: no
    join: nestedbigquery_1__col1 {
      view_label: "Nestedbigquery 1: Col1"
      sql: LEFT JOIN UNNEST(${nestedbigquery_1.col1}) as nestedbigquery_1__col1 ;;
      relationship: one_to_many
    }
    join: nestedbigquery_1__col1__item_name {
      view_label: "Nestedbigquery 1: Col1 Item Name"
      sql: LEFT JOIN UNNEST(${nestedbigquery_1__col1.item_name}) as nestedbigquery_1__col1__item_name ;;
      relationship: one_to_many
    }
}
view: nestedbigquery_1 {
  sql_table_name: `sqsh-developer-pocs.marketing_analytics.nestedbigquery_1` ;;

  dimension: col1 {
    hidden: yes
    sql: ${TABLE}.col1 ;;
  }
  measure: count {
    type: count
  }
}

view: nestedbigquery_1__col1 {

  dimension: item_name {
    hidden: yes
    sql: Item_Name ;;
  }
  dimension: nestedbigquery_1__col1 {
    type: string
    hidden: yes
    sql: nestedbigquery_1__col1 ;;
  }
  dimension: order_id {
    type: string
    sql: Order_Id ;;
  }
}

view: nestedbigquery_1__col1__item_name {

  dimension: nestedbigquery_1__col1__item_name {
    type: string
    sql: nestedbigquery_1__col1__item_name ;;
  }
}
