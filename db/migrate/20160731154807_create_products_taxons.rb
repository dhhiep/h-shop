class CreateProductsTaxons < ActiveRecord::Migration
  def change
    create_table :products_taxons do |t|
      t.integer :product_id
      t.integer :taxon_id
    end
  end
end
