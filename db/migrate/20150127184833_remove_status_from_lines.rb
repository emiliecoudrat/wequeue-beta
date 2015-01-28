class RemoveStatusFromLines < ActiveRecord::Migration
  def change
    remove_column :lines, :status, :boolean
  end
end
