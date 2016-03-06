class AddExpenseIdToLiquidations < ActiveRecord::Migration
  def change
    add_column :liquidations, :expense_id, :integer
  end
end
