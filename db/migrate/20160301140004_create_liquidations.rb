class CreateLiquidations < ActiveRecord::Migration
  def change
    create_table :liquidations do |t|
      t.string :liquidated_by_name

      t.timestamps null: false
    end
  end
end
