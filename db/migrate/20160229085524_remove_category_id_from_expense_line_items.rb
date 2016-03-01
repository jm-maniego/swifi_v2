class RemoveCategoryIdFromExpenseLineItems < ActiveRecord::Migration
  def change
    remove_column :expense_line_items, :category_id
  end
end
