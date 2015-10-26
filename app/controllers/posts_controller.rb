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

  private

  def post_params
    params.require(:post).permit(:option_a_title, :option_b_title, :explanation, :user_id)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
