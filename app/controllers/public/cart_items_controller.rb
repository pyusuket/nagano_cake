class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @total_amount = 0
  end
  
  def create
    @item = CartItem.new(cart_item_params)
    @item.customer_id = current_customer.id
    @item.save
    redirect_to cart_items_path
  end
  
  def destroy
    current_customer.items.destroy_all
  end
  private
 
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
