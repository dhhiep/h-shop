class Product < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug, use: :slugged

  has_many :variants
  has_many :images, :source => :images, :through => :variants

  validates :name, :presence => true
  validates :slug, :presence => true, :uniqueness => true
end