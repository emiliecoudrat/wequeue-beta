class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :set_line

  def index
    @posts = @line.posts.all.order('posts.created_at DESC')
  end

  def show
  end

  def new
    @post = @line.posts.new
  end

  def create
    @post = @line.posts.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to line_path(@line), notice: "Bravo, votre post a été pris en compte"
    else
      render :new, notice: "Oups, réessayez !"
    end
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

  def set_line
    @line = Line.find(params[:line_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:description, :picture, :user_id, :line_id)
  end
end
