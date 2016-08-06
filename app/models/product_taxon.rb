class ProductTaxon < ActiveRecord::Base
  self.table_name = 'products_taxons'
  
  belongs_to :taxon
  belongs_to :product
end