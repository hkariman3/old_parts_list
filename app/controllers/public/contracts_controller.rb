class Public::ContractsController < ApplicationController
  before_action :authenticate_customer!
  
  
  def confirm
    if params[:post_id].present?
      session[:post_id] = params[:post_id]
    end
    @post_id = session[:post_id]
    @contract = Contract.new
    @addresses = current_customer.addresses
    post_id = session[:post_id]
    if post_id.blank?
      redirect_to root_path, alert: "無効な操作です"
      return
    end
    @post = Post.find_by(id: post_id)
    
    if @post.nil?
      redirect_to root_path, alert: "商品が見つかりません"
      return
    end
  end

  def show
    @contract = Contract.find(params[:id])
  end
  
  def create
    @contract = Contract.new(contract_params)
    @post = Post.find(session[:post_id])
    @post.update(is_deleted: true)
    
    @contract.address = current_customer.addresses.first
    @contract.customer = current_customer
    @contract.post = @post
    @contract.postage = 800
    @contract.save!
    
    flash[:notice] = "購入完了。入金後ステータスを変えてください"
    redirect_to thanks_path
  end
  
  def index
    @customer = current_customer
  end
  
  def thanks
    @post_id = session[:post_id]
  end
  
  private
  
  def contract_params
    params.require(:contract).permit(:postage,:customer_id,:address_id,:post_id)
  end
  
  def post_params
    params.require(:post).permit(:is_deleted)
  end
end

