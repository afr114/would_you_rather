class PostsController < ApplicationController

  before_action :find_post, except: [:index, :new, :create]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post was created successfully"
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to posts_path
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
