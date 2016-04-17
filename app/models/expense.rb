class Expense < ActiveRecord::Base
  # include ActiveRecord::UnionScope

  has_many :expense_line_items, dependent: :destroy
  has_many :liquidations
  has_many :liquidation_line_items, through: :liquidations

  validates :job_order_id, presence: true
  validates :job_order_id, uniqueness: true

  accepts_nested_attributes_for :expense_line_items, reject_if: :line_item_rejectable?

  def build_expense_line_items
    # This could be very misleading because
    # expense_line_items consists of:
    # - The actual expense_line_item
    # - and default liquidation_categories
    except_category_names = expense_line_items.pluck(:name)
    ExpenseCategory.defaults.where.not(name: except_category_names).each do |default_expc|
      expense_line_items.build(name: default_expc.name)
    end
    expense_line_items
  end

  def expense_summary

  end

  def liquidation_summary
    liquidation_line_items.
      select(
        "liquidation_line_items.*, SUM(amount) AS amount, "\
        "IFNULL(liquidation_categories.name, liquidation_line_items.name) AS liquidation_name, " \
        "GROUP_CONCAT(DISTINCT(liquidations.id)) AS lq_ids"
        ).
      joins("LEFT JOIN liquidation_categories ON liquidation_line_items.liquidation_category_id = liquidation_categories.id").
      group("liquidation_name")
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
