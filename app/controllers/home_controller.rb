class HomeController < ApplicationController
  def index
  end

  private
    def content_layout
      @content_layout ||= 'layouts/content_layouts/full_width'
    end
end
