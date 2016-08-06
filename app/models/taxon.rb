class Taxon < ActiveRecord::Base
  has_many :product_taxons, dependent: :destroy, inverse_of: :product
  has_many :products, :through => :product_taxons
end