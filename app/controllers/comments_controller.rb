class CommentsController < ApplicationController

  before_action :find_post

  def new
    @comment = Comment.new()
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    @comment = Comment.new(comments_params)
    @comment['post_id'] = @post.id
    @comment['user_id'] = current_user.id
    @comment.save
    respond_to do |format|
      format.js
      format.html { redirect_to posts_path, flash[:success] = "Comment was created successfully" }
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
