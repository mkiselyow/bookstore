class OrderItemsController < ApplicationController
  def create
    p params[:book]
    redirect_to '/', notice: "Line Item Created"
  end
end
