class ExpenseLineItem < ActiveRecord::Base
  include Displayable

  belongs_to :expense
  belongs_to :expense_category

  validates :amount, numericality: true

  ACCESSIBLE_ATTRIBUTES = [
    :name,
    :reference,
    :amount,
    :id,
    :expense_category_id
  ]

  def amount
    return nil if super && super.zero?
    super
  end

  def amount=(amount)
    super amount.to_f
  end
end
