class OrdersController < ApplicationController
  def index
    @orders = Order.select('number, completed_date, status, total_price')
  end

  def show; end
  
  def new
    @order = Order.new
  end
  
  def create
    @order = @customer.orders.build(order_params)
    if current_customer
      @order.save
    else
      p 'session[:orders] << @order'
      session[:orders] << @order
    end
    redirect_to '/', notice: "Order Created"
  end

  private
  def set_customer
    @customer = current_customer || Customer.new
  end

  def order_params
    params.fetch(:order, {}).permit(:total_price, :completed_date, :state, :customer_id, :credit_card_id)
  end
end