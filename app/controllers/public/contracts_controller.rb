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
    @post = Post.find(@contract.post_id)
    @customer = Customer.find(@post.customer_id)
    @buyer = Customer.find(@contract.customer_id)
    @address = Address.find(@contract.address_id)
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
  
  def update
  @contract = Contract.find(params[:id])
  
  if current_customer.id == @contract.customer_id && params[:contract][:payment_status].present?
    if @contract.update(contract_params)
      if @contract.payment_status == "delivered" && @contract.delivery_status == "shipped"
        @contract.update(contract_status: "completed")
      end
      redirect_to contract_path(@contract)
    else
      flash[:danger] = "うまく更新されませんでした"
      render :show
    end
  elsif current_customer.id == @contract.post.customer_id && params[:contract][:delivery_status].present?
    if @contract.update(contract_params)
      if @contract.payment_status == "delivered" && @contract.delivery_status == "shipped"
        @contract.update(contract_status: "completed")
      end
      redirect_to contract_path(@contract)
    else
      flash[:danger] = "うまく更新されませんでした"
      render :show
    end
  else
    flash[:danger] = "許可されていないユーザーからの更新リクエストです"
    redirect_to contract_path(@contract)
  end
  end
  
  def index
    @customer = current_customer
    @contracts = Contract.where(customer_id: current_customer.post_ids)
  end
  
  def seller
    @contracts = Contract.where(post_id: current_customer.post_ids)
  end
  
  def thanks
    @post_id = session[:post_id]
  end
  
  private
  
  def contract_params
    params.require(:contract).permit(:postage,:customer_id,:address_id,:post_id,:payment_status,:delivery_status,:contract_status)
  end
  
  def post_params
    params.require(:post).permit(:is_deleted)
  end
end

