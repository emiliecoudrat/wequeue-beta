class HomeController < ApplicationController
  def index
    @lines = Line.order('lines.date DESC').first(5)
  end
end
