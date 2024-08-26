connection: "marketing_analytics"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#

datagroup: looker_poc_pdt {
  max_cache_age: "1 hours"
  # sql_trigger:SELECT CURRENT_TIMESTAMP() ;;
  interval_trigger: "1 hours"
}

explore: pdt {
  persist_with: looker_poc_pdt
}

explore: customers {

  access_filter: {
    field: stores.location
    user_attribute: market
  }

  join: transactions {
    sql_on: ${customers.customer_id} = ${transactions.customer_id} ;;
    relationship: one_to_many
  }

  join: interactions {
    sql_on: ${customers.customer_id} = ${interactions.customer_id} ;;
    relationship: one_to_many
  }

  join: products {
    sql_on: ${transactions.product_id} = ${products.product_id} ;;
    relationship: many_to_one
  }

  join: stores {
    sql_on: ${transactions.store_id} = ${stores.store_id} ;;
    relationship: many_to_one
  }

  join: campaigns {
    sql_on: ${interactions.campaign_id} = ${campaigns.campaign_id} ;;
    relationship: one_to_many
  }

  join: social_media_engagement {
    sql_on: ${campaigns.campaign_id} = ${social_media_engagement.campaign_id} ;;
    relationship: one_to_many
  }
}
