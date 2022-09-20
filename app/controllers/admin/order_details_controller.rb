class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    @order_detail.update(order_detail_params)
    # binding.pry
    if @order_detail.order.order_status != "producing" && @order_detail.production_status == "making"
      @order_detail.order.update(order_status: "producing")
    end

    complete_items = @order_details.where(production_status: "completion")
    if @order_details.count == complete_items.count
      @order_detail.order.update(order_status: "preparing")
      @order.save
    end

      flash[:notice] = "製作ステータスを更新しました。"
      redirect_to admin_order_path(@order_detail.order.id)
  end
  

  private

  def order_detail_params
    params.require(:order_detail).permit(:purchase_price, :quantity, :production_status, :order_id, :item_id)
  end

end
