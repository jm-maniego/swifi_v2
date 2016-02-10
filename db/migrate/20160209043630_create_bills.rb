class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.integer :consignee_id
      t.integer :shipper_id
      t.string :reference_number
      t.string :master_reference_number
      t.text :description
      t.string :carrier_name
      t.integer :quantity
      t.float :gross_weight
      t.float :chargeable_weight
      t.float :measurement
      t.string :registry_number
      t.string :port
      t.date :arrival_date
      t.date :estimated_arrival_date
      t.string :location
      t.string :carrier
      t.string :destination
      t.string :origin
      t.string :container_number
      t.string :invoice_number
      t.decimal :invoice_value

      t.timestamps null: false
    end
  end
end
