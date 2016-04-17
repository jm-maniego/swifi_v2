class LiquidationLineItem < ActiveRecord::Base
  # include ActiveRecord::UnionScope

  belongs_to :liquidation
  belongs_to :liquidation_category

  ACCESSIBLE_ATTRIBUTES = [
    :name,
    :amount,
    :liquidation_category_id,
    :remarks,
    :id
  ]
end