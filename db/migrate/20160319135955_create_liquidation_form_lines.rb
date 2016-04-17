class CreateLiquidationFormLines < ActiveRecord::Migration
  def change
    create_table :liquidation_form_lines do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
