class ChangeQuantityFormatInBills < ActiveRecord::Migration
  def change
    change_column :bills, :quantity, :string
  end
end
