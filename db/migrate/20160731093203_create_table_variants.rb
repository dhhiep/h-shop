class CreateTableVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.string :sku
      t.integer :product_id
      t.decimal :cost_price, precision: 8, scale: 2
      t.decimal :price, precision: 8, scale: 2
    end
  end
end
