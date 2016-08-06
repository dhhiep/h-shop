class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.integer :assetable_id
      t.string :assetable_type
      t.attachment :attachment
      t.text :alt
    end
  end
end
