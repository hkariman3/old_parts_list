class Public::CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.customer_id = current_customer.id
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post.id)
  end
  
  def show
    @post = Post.find_by(id: params[:post_id])
    if @post.nil?
      redirect_to root_path
    else
      @comments = @post.comments.order(created_at: :desc)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment,:post_id,:customer_id)
  end
end
