class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order_detail = OrderDetail.find(params[:id])
    @customer = @order.customer
    @orders = Order.all
    @order_details_total = @order_details.sum { |detail| detail.price * detail.amount }
    @order_cost = 800
  end
end
