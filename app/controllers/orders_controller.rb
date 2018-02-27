class OrdersController < ApplicationController
  def index
    @orders = Order.select('number, completed_date, status, total_price')
  end

  def show; end
  
  def new
    @order = Order.new
  end
end