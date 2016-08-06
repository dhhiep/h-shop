class CreateTaxons < ActiveRecord::Migration
  def change
    create_table :taxons do |t|
      t.string :name
      t.string :permalink
      t.integer :parent_id
    end
    add_index :taxons, :permalink, unique: true
  end
end
