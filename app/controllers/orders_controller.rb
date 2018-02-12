class OrdersController < ApplicationController
  def index
  end

  def show
    render "view_orders" 
  end
  
  def new
    render "cart"
  end
end