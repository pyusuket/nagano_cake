class Public::ItemsController < ApplicationController
  def index
    @items = Item.where(sale_status: true).page(params[:page]).per(8)
  end
  
  def show
    @item = Item.find(params[:id])
  end
end
