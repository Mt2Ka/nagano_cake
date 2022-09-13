class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!


  def index
    @cart_items = current_customer.cart_items.all
    @total = 0
  end

  def create
    cart_item = current_customer.cart_items.new(cart_item_params)
    
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      flash[:notice] = "商品をカートに追加しました。"
      redirect_to cart_items_path
    elsif cart_item.save
      flash[:notice] = "商品をカートに追加しました。"
      redirect_to cart_items_path
    else
      flash[:alert] = "商品の追加に失敗しました。"
      # redirect_to item_path(cart_item.item)
      render :show
    end
  end

  def update
    @cart_items = current_customer.cart_items.all
    cart_item = current_customer.cart_items.find_by(id: params[:id])

    if cart_item.update(cart_item_params)
      flash[:notice] = "カート内商品の数量を変更しました。"
      redirect_to cart_items_path
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:notice] = "カート内商品を１件削除しました。"
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    flash[:notice] = "カート内商品を全て削除しました。"
    redirect_to cart_items_path

  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id,:amount,:customer_id)
  end
  

end
