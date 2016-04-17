class CreateLiquidationCategories < ActiveRecord::Migration
  def change
    create_table :liquidation_categories do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
