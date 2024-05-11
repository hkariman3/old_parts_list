class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:show]
  before_action :authorize_customer, only: [:edit, :update]

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
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customers_path
  end

  private
  
  def authorize_customer
    @customer = Customer.find(params[:id])
  unless current_customer == @customer
    redirect_to root_path, alert: "アクセス権限がありません"
  end
  end

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:nickname,:email,:telephone_number,:introduction)
  end
end
