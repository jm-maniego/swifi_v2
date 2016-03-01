class AddDefaultFlagToExpenseCategories < ActiveRecord::Migration
  def change
    add_column :expense_categories, :default_flag, :bool, default: 0
  end
end
