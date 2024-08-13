class CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_current_order

  private
    def set_current_order
      @current_order = current_customer.orders.find_by(status: 'cart') || current_customer.orders.create(status: 'cart')
    end

    def current_order
      @current_order
    end
end
