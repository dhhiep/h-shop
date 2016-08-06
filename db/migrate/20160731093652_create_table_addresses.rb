class CreateTableAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.text :address
      t.string :city
      t.string :state
      t.string :country
      t.string :phone
    end
  end
end
