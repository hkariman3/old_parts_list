class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    @post.save
    redirect_to posts_path
  end

  def index
    @posts = Post.all

    if params[:genre_id][:genre_id].present?
      @post = Post.where(genre_id: params[:genre_id][:genre_id])
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path
  end
  private

  def post_params
    params.require(:post).permit(:name,:introduction,:price, :genre_id, {images: []})
  end
end
