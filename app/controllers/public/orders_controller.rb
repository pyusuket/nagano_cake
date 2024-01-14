class Public::OrdersController < ApplicationController
  def new
    @customer = current_customer
    @order = Order.new
  end
  
  def index
    @orders = current_customer.orders.page(params[:page]).per(10)
    @order_details = OrderDetail.all
  end
  
  def show
    @order = Order.find(params[:id])
    @customer = Customer.find_by(id: @order.customer_id)
    @order_details = @order.order_details.page(params[:page]).per(10)
    @order_details_total = @order_details.sum { |detail| detail.price * detail.amount }
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      current_customer.cart_items.each do |cart_item| 
        order_detail = OrderDetail.new
        order_detail.order_id = @order.id
        order_detail.item_id = cart_item.item_id
        order_detail.amount = cart_item.amount
        order_detail.price = cart_item.item.price
        order_detail.save
      end
      current_customer.cart_items.destroy_all
      redirect_to orders_thanks_path
    end
  end
  
  def confirm
    @cart_items = current_customer.cart_items
    @total_amount = 0
    @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "1"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end
  
  def thanks
    
  end
  
  private
  
  def order_params
    params.require(:order).permit(:customer_id, :name, :postal_code, :address, :postage, :payment_method, :total_payment, :order_status)
  end
  

end
