class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :contact_person
      t.string :contact_number

      t.timestamps null: false
    end
  end
end
