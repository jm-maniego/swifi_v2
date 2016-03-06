class CreateLiquidationLineItems < ActiveRecord::Migration
  def change
    create_table :liquidation_line_items do |t|
      t.string :name
      t.integer :expense_category_id
      t.decimal :amount, precision: 10, scale: 2
      t.string :type
      t.integer :liquidation_id
      t.text :remarks

      t.timestamps null: false
    end
  end
end
