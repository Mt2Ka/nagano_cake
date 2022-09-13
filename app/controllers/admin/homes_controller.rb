class Admin::HomesController < ApplicationController

  def top
   @orders = Order.page(params[:page]).per(10).order(created_at: :desc)
   @order_details = OrderDetail.all
  end

  
end
