class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def new
    @address = Address.new
    @addresses = current_customer.addresses.page(params[:page])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to new_address_path
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to new_address_path
  end

  private
  
  def address_params
    params.require(:address).permit(:address,:postal_code,:telephon_number,:name,:customer_id)
  end
  
end
