class Admin::OrdersController < ApplicationController
  def show
    @order_details = OrderDetail.find(params[:id])
    @customer = Order.find(params[:id])
  end
end
