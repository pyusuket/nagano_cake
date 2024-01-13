class Admin::OrdersController < ApplicationController
  def show
    @order_details = OrderDetail.page(params[:page]).per(10)
    @customer = Order.find(params[:id])
  end
end
