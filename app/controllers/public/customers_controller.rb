class Public::CustomersController < ApplicationController
# before_action :authenticate_customers!
# before_action :correct_post,only: [:edit,:update,:confirm,:unsubscribe]

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer

  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を更新しました。"
      redirect_to show_path(@customer)
    else
      flash[:alert] = "会員情報の更新に失敗しました。"
      render edit
    end
  end

  def confirm
  end

  def unsubscribe
    @customer = current_customer
    if @customer.update(is_active: false)
      reset_session
      flash[:notice] = "退会処理を実行しました。"
      redirect_to root_path
    end
  end

  # def correct_post
  #   unless @customer == current_customer
  #     redirect_to root_path
  #   end
  # end

  private

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number,:is_active,:email)
  end


end
