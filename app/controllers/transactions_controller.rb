class TransactionsController < ApplicationController
  before_action :load_resource

  def checkout
  end

  def place_order
  end

  def completed
  end

  private
    def load_resource
    end
end