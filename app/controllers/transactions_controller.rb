class TransactionsController < ApplicationController
  before_action :load_resource
  before_action :ensure_checkout_steps, :only => [:checkout]

  def checkout
  end

  def place_order
  end

  def completed
  end

  private
  def load_resource
  end

  def content_layout
    @content_layout = 'layouts/content_layouts/full_width'
  end

  def ensure_checkout_steps
    params[:step] ||= 'login'
    redirect_to cart_transactions_path and return unless %w(login address payment).include?(params[:step])
  end
end