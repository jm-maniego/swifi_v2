class AddNumberToJobOrders < ActiveRecord::Migration
  def change
    add_column :job_orders, :number, :integer, default: 0, null: false
  end
end
