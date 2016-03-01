class CreateLiquidationLineItems < ActiveRecord::Migration
  def change
    create_table :liquidation_line_items do |t|
      t.string :name
      t.integer :expense_category_id
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
