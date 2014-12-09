class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = @line.post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(line_params)
    @post.save
    redirect_to lines_path
  end

  def edit
  end

  def update
    @post.update(post_params)
  end

  def destroy
    @post.destroy
    redirect_to lines_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def line_params
    params.require(:post).permit(:description, :picture, :post_id, :user_id)
  end
end
