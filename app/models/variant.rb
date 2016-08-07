class Variant < ActiveRecord::Base
  belongs_to :product
  has_many :images, :as => :assetable, :class_name => 'Asset'
  has_many :option_values, :class_name => "VariantOptionValue"

  def options_text
    option_values.map{|o| "#{o.option_type.presentation}: #{o.value.to_s.titleize}"}.join(' - ')
  end

  def in_stock?
    count_on_hand > 0
  end

  def discount?
    cost_price > price
  end

  def discount_amount
    cost_price - price
  end

  def display_price
    Money.new(price, ENV['CURRENCY']).format(symbol_after_without_space: true)
  end

  def display_cost_price
    Money.new(cost_price, ENV['CURRENCY']).format(symbol_after_without_space: true)
  end

  def discount_percent
    "#{((discount_amount * 100)/cost_price).round }%"
  end
end