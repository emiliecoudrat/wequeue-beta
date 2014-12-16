class AddZipcodeToLines < ActiveRecord::Migration
  def change
    add_column :lines, :zipcode, :string
  end
end
