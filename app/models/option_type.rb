class OptionType < ActiveRecord::Base
  validates :name, :uniqueness => true, :presence => true
  has_many :option_values, :class_name => "VariantOptionValue"
end