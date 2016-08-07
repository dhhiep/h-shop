class AddColumnCountOnHandToVariants < ActiveRecord::Migration
  def change
    add_column :variants, :count_on_hand, :integer, :default => 0
  end
end
