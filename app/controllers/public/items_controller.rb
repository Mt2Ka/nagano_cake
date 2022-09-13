class Public::ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def index
    @items = Item.page(params[:page]).per(8)
  end
  
  def with_tax_price
    (price * 1.1).floor
  end


end
