class CreateTableOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :number
      t.decimal :item_total, precision: 8, scale: 2
      t.decimal :subtotal, precision: 8, scale: 2
      t.string :state
      t.integer :user_id
      t.datetime :completed_at
      t.integer :ship_address_id
      t.integer :bill_address_id
      t.string :email
    end
  end
end
