class Public::HomesController < ApplicationController
    def top
      @items = Item.page(params[:page]).per(8)
    end
  
    def about
    
    end
end
