class HomeController < ApplicationController
  def index
    @hot_products = Product.limit(20)
    @products = Product.order("RANDOM()").limit(16)
  end

  private
    def content_layout
      @content_layout ||= 'layouts/content_layouts/full_width'
    end
end
