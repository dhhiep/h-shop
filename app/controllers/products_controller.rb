class ProductsController < ApplicationController
  before_action :load_resource

  def index
  end

  def show
    @product = Product.friendly.find(params[:id])
    @product_related = Product.limit(10)
  end

  private
    def load_resource
      @title = @product_name
      if collection?
        @products = []
      else
        @product = []
      end   
    end
end