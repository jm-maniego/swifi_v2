class CreateExpenseLineItems < ActiveRecord::Migration
  def change
    create_table :expense_line_items do |t|
      t.integer :expense_id
      t.integer :category_id
      t.decimal :amount
      t.string :reference

      t.timestamps null: false
    end
  end
end
