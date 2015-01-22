class HomeController < ApplicationController
  def index
    @place = params[:place]
    @event = params[:event]
    @lines = Line.all.order('lines.date DESC').first(5)
  end

  private

  def set_line
    @line = Line.find(params[:id])
  end

  def line_params
    params.require(:line).permit(:place, :event, :city, :address, :zipcode, :date, :user_id)
  end
end
