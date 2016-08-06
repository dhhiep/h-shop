class CreateTableLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :order_id
      t.integer :variant_id
      t.decimal :price, precision: 8, scale: 2
      t.integer :quantity
    end
  end
end
