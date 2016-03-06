class Expense < ActiveRecord::Base
  has_many :expense_line_items, dependent: :destroy
  has_many :liquidations

  validates :job_order_id, presence: true
  validates :job_order_id, uniqueness: true

  accepts_nested_attributes_for :expense_line_items, reject_if: :line_item_rejectable?

  def build_expense_line_items
    except_category_names = expense_line_items.pluck(:name)
    ExpenseCategory.defaults.where.not(name: except_category_names).each do |default_expense_category|
      expense_line_items.build(name: default_expense_category.name)
    end
    expense_line_items
  end

  def total_amount
    expense_line_items.sum(:amount)
  end

  class << self
    # Use this if expense_line_items array is already present
    def total_amount(expense_line_items)
      expense_line_items.select{ |eli| eli.amount.present? }.inject(0) {|a, eli| a + eli.amount}
    end
  end

  def line_item_rejectable?(li_attributes)
    line_item_is_new_record = new_record? || li_attributes["id"].blank?
    li_amount_is_zero = li_attributes["amount"].to_f.zero?
    line_item_is_new_record && li_amount_is_zero
  end
end
