class AddJobOrderIdToBills < ActiveRecord::Migration
  def change
    add_column :bills, :job_order_id, :integer, null: false
  end
end
