class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_post

  def index
    @comments = @post.comments.all
  end

  def show
  end

  def new
    @comment = @post.comments.new
  end

  def create
    @line = Line.find(params[:line_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to line_path(@line), notice: "Bravo, votre comment a été pris en compte"
    else
      render :new, notice: "Oups, réessayez !"
    end
  end

  def edit
  end

  def update
    @comment.update(comment_params)
  end

  def destroy
    @comment.destroy
    redirect_to lines_path(@line)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @post = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
