class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :description
      t.integer :duration
      t.string :picture
      t.references :user, index: true
      t.references :line, index: true

      t.timestamps
    end
  end
end
