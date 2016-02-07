class CreateJobOrders < ActiveRecord::Migration
  def change
    create_table :job_orders do |t|
      t.integer :client_id, null: false
      t.integer :mode_of_shipment, default: 0, null: false
      t.integer :service_type, default: 0, null: false
      t.integer :services, default: 0, null: false

      t.timestamps null: false
    end
  end
end
