class AddZipcodeToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :zipcode, :string
  end
end
