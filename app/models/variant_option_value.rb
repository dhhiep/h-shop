class VariantOptionValue < ActiveRecord::Base
  belongs_to :option_type
  belongs_to :variant
end