class AddPrecisionAndScaleToDecimalFields < ActiveRecord::Migration
  def change
    change_column :bills, :invoice_value, :decimal, precision: 10, scale: 2
    change_column :expense_line_items, :amount, :decimal, precision: 10, scale: 2
  end
end
