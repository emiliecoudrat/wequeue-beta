class AddCityToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :city, :string
  end
end
