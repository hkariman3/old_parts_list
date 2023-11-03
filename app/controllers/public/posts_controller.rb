class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to posts_path
  end

  def index
    @posts = Post.all
  end


  private

  def post_params
    params.require(:post).permit(:name,:introduction,:price, {images: []})
  end
end
