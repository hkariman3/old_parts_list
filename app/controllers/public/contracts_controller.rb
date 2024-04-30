class Public::ContractsController < ApplicationController
  before_action :authenticate_customer!
  
  def confirm
  post_id = session[:post_id]
  @post = Post.find(post_id)
  end

  def show
    
  end
  
  def create
    @confirm = Contract.new()
  end
  
  def index
  end
  
  private
  
  def contract_params
    params.require(:contract).permit(:total_price,:postage,
  end
end

