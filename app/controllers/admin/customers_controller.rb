class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @customers = Customer.page(params[:page])
  end
  
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    flash[:notice] = 'ユーザーを削除しました'
    redirect_to admin_customers_path
  end
  
  private
  
  def authenticate_admin!
  unless current_admin
    flash[:alert] = "アクセス権限がありません"
    redirect_to root_path
  end
  end
  
end
