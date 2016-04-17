class AddLiquidationCategoryIdToLiquidationLineItems < ActiveRecord::Migration
  def change
    add_column :liquidation_line_items, :liquidation_category_id, :integer
  end
end
