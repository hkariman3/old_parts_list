class Public::PostsController < ApplicationController
  before_action :authenticate_customer!, except: [:index,:show,:list]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      redirect_to posts_path
    else
      flash.now[:error] = @post.errors.full_messages.first
      render :new
    end
  end
  
  
  
  def index
    @posts = Post.where(is_deleted: false).page(params[:page])
  
    if params[:genre_id].present? && params[:genre_id][:genre_id].present?
      @posts = @posts.where(genre_id: params[:genre_id][:genre_id])
    end
    @posts = @posts.page(params[:page])
  end

  def show
    @post = Post.find_by(id: params[:id])
    @customer = @post.customer
    @address = current_customer&.addresses
      if @post.nil?
        redirect_to root_path
      else
        @comment = Comment.new
        @comments = @post.comments.limit(10)
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
  
  def list
    @customer = Customer.find(params[:id])
    @posts = @customer.posts.where(is_deleted: false)
  end
  
  private

  def post_params
    params.require(:post).permit(:name,:introduction,:price, :genre_id, {images: []})
  end
end