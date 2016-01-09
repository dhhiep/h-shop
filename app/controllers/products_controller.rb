class ProductsController < ApplicationController
  before_action :load_resource

  def index
  end

  def show
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