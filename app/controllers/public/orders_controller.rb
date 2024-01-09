class Public::OrdersController < ApplicationController
  def new
    @customer = current_customer
    @order = Order.new
  end
  
  def index
    
  end
  
  def show
    
  end
  
  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_thanks_path
  end
  
  def confirm
    @cart_items = current_customer.cart_items
    @total_amount = 0
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
  end
  
  def thanks
    
  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
  

end
