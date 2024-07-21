connection: "marketing_analytics"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: customers {
  join: interactions {
    sql_on: ${customers.customer_id} = ${interactions.interaction_id} ;;
    relationship: one_to_one
  }

  join: transactions {
    sql_on: ${customers.customer_id} = ${transactions.transaction_id} ;;
    relationship: one_to_many
  }
}


explore: products {
  join: transactions {
    sql_on: ${products.product_id} = ${transactions.transaction_id} ;;
    relationship: one_to_many
  }

  join: campaigns {
    sql_on: ${products.product_id} = ${campaigns.campaign_id} ;;
    relationship: one_to_many
  }

}

explore: campaigns {
  join: social_media_engagement {
    sql_on: ${campaigns.campaign_id} = ${social_media_engagement.engagement_id} ;;
    relationship: one_to_many
  }

  join: interactions {
    sql_on: ${campaigns.campaign_id} = ${interactions.interaction_id} ;;
    relationship: one_to_one
  }
}

explore: stores {
  join: transactions {
    sql_on: ${stores.store_id} = ${transactions.transaction_id} ;;
    relationship: one_to_many
  }
}
