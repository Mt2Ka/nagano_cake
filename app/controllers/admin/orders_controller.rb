class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    # @orders = Order.all
    @order_details = @order.order_details
    @amount_total = @order.billing_amount - @order.postage
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "注文ステータスを更新しました。"
      redirect_to admin_order_path(@order.id)
    end
  end

  private

  def order_params
    params.require(:order).permit(:delivery_name,:delivery_postal_code,:delivery_address,:payment_method,:billing_amount,:postage,:order_status,:address_id)
  end

end
