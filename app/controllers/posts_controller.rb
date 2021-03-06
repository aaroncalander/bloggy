class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :delete]

  before_action :authenticate_admin!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    if @post.save(post_params)
      flash[:notice] = "Post created successfully!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Post not created, try again."
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      flash[:notice] = "Post updated successfully!"
      redirect_to post_path(@posts)
    else
      flash[:alert] = "Post not updated, try again."
      render :edit
    end
  end

  def show
  end

  def destroy
    if @post.destroy
      flash[:notice] = "Post deleted successfully!"
      redirect_to posts_path
    else
      flash[:alert] = "Post not updated, try again."
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
