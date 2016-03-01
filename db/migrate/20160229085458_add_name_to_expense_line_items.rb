class AddNameToExpenseLineItems < ActiveRecord::Migration
  def change
    add_column :expense_line_items, :name, :string, null: false
  end
end
