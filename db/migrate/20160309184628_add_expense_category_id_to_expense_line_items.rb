class AddExpenseCategoryIdToExpenseLineItems < ActiveRecord::Migration
  def change
    add_column :expense_line_items, :expense_category_id, :integer
  end
end
