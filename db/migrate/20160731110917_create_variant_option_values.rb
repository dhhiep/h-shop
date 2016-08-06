class CreateVariantOptionValues < ActiveRecord::Migration
  def change
    create_table :variant_option_values do |t|
      t.integer :variant_id
      t.integer :option_type_id
      t.string :value
    end
  end
end
