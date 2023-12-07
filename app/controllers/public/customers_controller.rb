class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts.all
  end

  def index
    @customer = current_customer
  end

  def contract
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to customer_path(customer.id)
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:nickname,:email,:telephone_number,:introduction)
  end
end
