class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :content_layout, :show_slider?, :hide_breadcrumbs?, :show_page_loading?


  private
    def show_slider?
      params[:controller] == "home" && params[:action] == "index"
    end

    def show_page_loading?
      params[:controller] == "home" && params[:action] == "index"
    end

    def hide_breadcrumbs?
      ['home#index'].include?(page_id) || %w(transactions).include?(controller_name)
    end

    def collection?
      %w(index).include? params
    end

    def content_layout
      @content_layout ||= 'layouts/content_layouts/right_sidebar'
    end

    def page_id
      "#{controller_name}##{action_name}"
    end
end
