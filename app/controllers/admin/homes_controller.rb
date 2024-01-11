class Admin::HomesController < ApplicationController

  def top
    @order_details = Order.page(params[:page]).per(10)
    @cart_item_total_amounts = CartItem.group(:order_id).sum(:amount)
  end
  
end
