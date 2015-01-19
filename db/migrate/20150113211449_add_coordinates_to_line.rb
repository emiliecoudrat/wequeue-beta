class AddCoordinatesToLine < ActiveRecord::Migration
  def change
    add_column :lines, :latitude, :float
    add_column :lines, :longitude, :float
  end
end
