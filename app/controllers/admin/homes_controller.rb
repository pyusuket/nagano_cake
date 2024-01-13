class Admin::HomesController < ApplicationController

  def top
    @orders = Order.page(params[:page]).per(10)
    @total_amount = OrderDetail.sum(:amount)
  end
  
end
