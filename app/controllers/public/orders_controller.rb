class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @orders = current_customer.orders
  end

  def confirm
    @order = Order.new
    @cart_items = current_customer.cart_items.all
    if params[:order][:delivery_address].to_i == 0
      @order.delivery_postal_code = current_customer.postal_code
      @order.delivery_address = current_customer.address
      @order.delivery_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:delivery_address].to_i == 1
      @address = Address.find(params[:order][:address_id])
      @order.delivery_postal_code = @address.postal_code
      @order.delivery_address = @address.address
      @order.delivery_name = @address.name
    else params[:order][:delivery_address].to_i == 2
      @address = Address.new(address_params)
      @order.delivery_postal_code = @address.postal_code
      @order.delivery_address = @address.address
      @order.delivery_name = @address.name
    end

    @order.payment_method = params[:order][:payment_method]
    @order.postage = 800
    @cart_items = current_customer.cart_items.all
    @total = 0
    @amount_total= @cart_items.inject(0) { |sum,item|sum + item.subtotal }
    @order.billing_amount = @amount_total + @order.postage
  end

  def complete
  end

  def create
    @orders = current_customer.orders.new(order_params)
    cart_items = current_customer.cart_items.all
    if @orders.save
      cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item.id
        order_detail.quantity = cart_item.amount
        order_detail.order_id = @orders.id
        order_detail.purchase_price = cart_item.item.price 
        order_detail.save
      end
      current_customer.cart_items.destroy_all
      redirect_to complete_path
    end
  end

  def index
    @orders = current_customer.orders
    @cart_items = current_customer.cart_items.all
  end

  def show
    @order = Order.find(params[:id])
    @orders = current_customer.orders
  end

  private

  def order_params
    params.require(:order).permit(:delivery_name,:delivery_postal_code,:delivery_address,:payment_method,:billing_amount,:postage,:order_status,:address_id)
  end

  def address_params
  params.require(:order).permit(:name, :address, :postal_code)
  end

end
