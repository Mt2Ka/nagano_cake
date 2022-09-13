class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  # before_action :correct_post,only: [:index,:edit,:create,:update,:destroy]

  
  def index
    @address = Address.new
    @addresses = current_customer.addresses.all
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer = current_customer
    if @address.save
      flash[:notice] = "配送先を追加しました。"
      redirect_to addresses_path
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "配送先を変更しました。"
      redirect_to addresses_path
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    flash[:notice] = "登録された配送先を１件削除しました。"
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address, :customer_id)
  end

end