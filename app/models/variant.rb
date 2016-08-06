class Variant < ActiveRecord::Base
  belongs_to :product
  has_many :images, :as => :assetable, :class_name => 'Asset'
  has_many :option_values, :class_name => "VariantOptionValue"

  def options_text
    option_values.map{|o| "#{o.option_type.presentation}: #{o.value.to_s.titleize}"}.join(' - ')
  end
end