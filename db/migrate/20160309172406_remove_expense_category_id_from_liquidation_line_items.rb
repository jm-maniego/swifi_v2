class RemoveExpenseCategoryIdFromLiquidationLineItems < ActiveRecord::Migration
  def change
    remove_column :liquidation_line_items, :expense_category_id
  end
end
