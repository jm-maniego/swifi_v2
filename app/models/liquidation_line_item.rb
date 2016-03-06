class LiquidationLineItem < ActiveRecord::Base
  belongs_to :liquidation

  ACCESSIBLE_ATTRIBUTES = [
    :name,
    :amount,
    :expense_category_id,
    :remarks
  ]
end