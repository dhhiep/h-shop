class ProductsController < ApplicationController
  before_action :load_resource

  def index
  end

  def show
  end

  private
    def load_resource
      if collection?
        @products = []
      else
        @product = []
      end   
    end
end