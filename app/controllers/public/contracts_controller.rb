class Public::ContractsController < ApplicationController
  before_action :authenticate_customer!
  
  
  def confirm
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
    
  end
  
  def create
    @post = Post.find(params[:post_id])
    post.update(deleted: true)
    @confirm = Contract.new(contract_params)
    @confirm.save
    flash[:notice] = "投稿に成功しました"
    redirect_to thanks_path
    
  end
  
  def index
  end
  
  def thanks
  end
  
  private
  
  def contract_params
    params.require(:contract).permit(:postage,:buyer_id,:address_id,:post_id)
  end
end

