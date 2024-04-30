class Public::ContractsController < ApplicationController
  
  def confirm
  post_id = session[:post_id]
  @post = Post.find(post_id)
  end

  def show
    
  end
  
  def create
  end
  
  def index
  end
end

