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
    @line.user_id = current_user.id
    if @line.save
      redirect_to line_path(@line), notice: "Bravo, votre file d'attente a été créée"
    else
      render :new, notice: "Oups, réessayez !"
    end
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
    params.require(:line).permit(:place, :event, :city, :address, :date, :user_id)
  end
end
