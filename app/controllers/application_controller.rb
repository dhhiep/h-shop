class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :content_layout, :show_slider?, :hide_breadcrumbs?, :show_page_loading?

  rescue_from ActionController::InvalidCrossOriginRequest, :with => :render_error
  rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
  rescue_from ActionController::RoutingError, with: :render_not_found

  def render_not_found
    load_full_width_layout
    respond_to do |f| 
      f.html{ render :template => "errors/404", :status => 404 }
      f.js{ render :json => {:errors => '404 Not Found'}, :status => 404 }
    end
  end

  def render_error
    load_full_width_layout
    respond_to do |f| 
      f.html{ render :template => "errors/500", :status => 500 }
      f.js{ render :json => {:errors => '500 internal server error'}, :status => 500 }
    end
  end

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

  def load_full_width_layout
    @content_layout = 'layouts/content_layouts/full_width'
  end
end
