class Public::PostsController < ApplicationController
  before_action :authenticate_customer!, except: [:index,:show,:mylike]

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
    @posts = Post.where(is_deleted: false)
  
    if params[:genre_id].present? && params[:genre_id][:genre_id].present?
      @posts = @posts.where(genre_id: params[:genre_id][:genre_id])
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @address = current_customer&.addresses
      if @post.nil?
        redirect_to root_path
      else
        @comment = Comment.new
        @comments = @post.comments
      end
    session[:post_id] = params[:id]
    @show_button = current_customer.present? && @address.present?
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path
  end
  
  def mylike
    customer = Customer.find(current_customer.id)
    if customer.likes.any?
      @likes = customer.likes.joins(:post).where(posts: { is_deleted: false })
      @like_count = @likes.count
    else
      @like_count = 0
    end
  end
  
  private

  def post_params
    params.require(:post).permit(:name,:introduction,:price, :genre_id, {images: []})
  end
end