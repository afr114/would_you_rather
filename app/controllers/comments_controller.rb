class CommentsController < ApplicationController

  before_action :find_post

  def new
    @comment = Comment.new()
  end

  def create
    @comment = Comment.new(comments_params)
    @comment['post_id'] = @post.id
    if @comment.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to posts_path
  end

  private
    def comments_params
      params.require(:comment).permit(:content, :user_id, :post_id)
    end
    def find_post
      @post = Post.find(params[:post_id])
    end
end
