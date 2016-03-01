class ExpenseLineItem < ActiveRecord::Base
  include Displayable

  belongs_to :expense

  validates :amount, numericality: true

  ACCESSIBLE_ATTRIBUTES = [
    :name,
    :reference,
    :amount,
    :id
  ]

  def amount=(amount)
    super(amount.to_f)
  end
end
