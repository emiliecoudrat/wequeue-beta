class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :place
      t.string :city
      t.string :address
      t.string :event
      t.date :date
      t.boolean :status
      t.references :user, index: true

      t.timestamps
    end
  end
end
