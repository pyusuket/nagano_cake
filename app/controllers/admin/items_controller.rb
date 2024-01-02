class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  
  def new
    
  end
  
  def show
    @admin = current_admin
    @item = Item.find(params[:id])
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path(@item.id)
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id]) 
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render :edit
    end
  end
  
  def destroy
    
  end
  
  private
  
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price , :sale_status)
  end
end
