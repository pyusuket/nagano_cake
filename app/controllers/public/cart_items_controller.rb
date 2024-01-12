class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total_amount = 0
  end
  
  def create
    @item = CartItem.new(cart_item_params)
    @item.customer_id = current_customer.id
    current_cart_item = current_customer.cart_items.find_by(item_id: @item.item_id)
    if current_cart_item
      current_cart_item.amount += @item.amount.to_i
      current_cart_item.update(amount: current_cart_item.amount)
    else 
      @item.save
    end
      redirect_to cart_items_path
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    logger.debug "params: #{params}" # デバッグログ
    @cart_item.amount = params[:cart_items][@cart_item.id.to_s][:amount]
    @cart_item.save
    redirect_to cart_item_path
  end
  
  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path, notice: 'カートが空になりました。'
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])  
    @cart_item.destroy 
    redirect_to cart_items_path, notice: "商品を削除しました"
  end
  
  private
 
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
