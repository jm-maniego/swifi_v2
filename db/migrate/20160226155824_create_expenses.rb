class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :job_order_id

      t.timestamps null: false
    end
  end
end
