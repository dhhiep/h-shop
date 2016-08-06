class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  
  belongs_to :bill_address, foreign_key: :bill_address_id, class_name: 'Address'
  alias_attribute :billing_address, :bill_address

  belongs_to :ship_address, foreign_key: :ship_address_id, class_name: 'Address'
  alias_attribute :shipping_address, :ship_address
end