class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:show]

  def show
    @customer = Customer.find_by(id: params[:id])
    
    if @customer.nil?
      redirect_to posts_path
    else
      @posts = @customer.posts.all
    end
  end

  def index
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
    if @item.customer_id != current_customer.id
    redirect_to root_path
    end
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
