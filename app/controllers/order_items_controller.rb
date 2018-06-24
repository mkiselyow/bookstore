class OrderItemsController < ApplicationController
  before_action :set_order
  
  def create
    @order_item = @order.order_items.build(order_item_params)
    p order_item_params
    p params
    if current_customer
      @order_item.save
    else
      p 'session[:order_items] << @order_item'
      session[:order_items] ||= []
      session[:order_items] << @order_item
    end
    redirect_to '/', notice: "Line Item Created"
  end

  private
  def set_order
    @order = (current_customer.orders.last if current_customer) || Order.new
  end

  def order_item_params
    params.fetch(:order_item, {}).permit(:book_id, :order_id)
  end
end
