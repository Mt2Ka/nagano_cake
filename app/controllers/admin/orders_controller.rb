class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    # @orders = Order.all
    @order_details = @order.order_details
    @amount_total = @order.billing_amount - @order.postage
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_details = @order.order_details
      if @order.order_status == "waiting"
        @order_details.each do |order_detail|
          order_detail.production_status = "impossible"
          order_detail.save
        end
      elsif @order.order_status == "paid_up"
        @order_details.each do |order_detail|
          order_detail.production_status = "waiting"
          order_detail.save
        end
      elsif @order.order_status == "producing"
        @order_details.each do |order_detail|
          order_detail.production_status = "maiking"
          order_detail.save
        end
      elsif @order.order_status == "preparing"
        @order_details.each do |order_detail|
          order_detail.production_status = "completion"
          order_detail.save
        end
      else
        @order_details.each do |order_detail|
          order_detail.production_status = "completion"
          order_detail.save
        end
      end

      flash[:notice] = "注文ステータスを更新しました。"
      redirect_to admin_order_path(@order.id)

  end

  private

  def order_params
    params.require(:order).permit(:delivery_name,:delivery_postal_code,:delivery_address,:payment_method,:billing_amount,:postage,:order_status,:address_id)
  end

end
