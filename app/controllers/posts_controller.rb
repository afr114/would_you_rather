class PostsController < ApplicationController

  before_action :find_post, except: [:index, :new, :create]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    @post = Post.new(post_params)
    @post.save
    respond_to do |format|
        format.js
        format.html { redirect_to posts_path, flash[:success] = "Post was created successfully" }
    end
  end

  def edit
    respond_to do |format|
      format.js
      format.html
    end
  end

  def update
    @post.update(post_params)
    respond_to do |format|
      format.js
      format.html { redirect_to posts_path, flash[:success] = "Post was updated successfully" }
    end
  end

  def destroy
    @post.destroy()
    redirect_to posts_path
  end

  def upvote
    @post.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @post.downvote_by current_user
    redirect_to :back
  end

  private

  def post_params
    params.require(:post).permit(:option_a_title, :option_b_title, :explanation, :user_id, :image, :image_url)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
