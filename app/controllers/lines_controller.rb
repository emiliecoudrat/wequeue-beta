class LinesController < ApplicationController
  before_action :set_line, only: [:show, :edit, :update, :destroy]

  def index
    @lines = Line.all
  end

  def show

  end

  def new
    @line = Line.new
  end

  def create
    @line = Line.new(line_params)
    @line.save
    redirect to line_path
  end

  def edit
  end

  def update
    @line.update(line_params)
  end

  def destroy
  end

  private

  def set_line
    @line = Line.find(params[:id])
  end

  def line_params
    params.require(:line).permit(:place, :city, :address, :date, :user_id)
  end
end
