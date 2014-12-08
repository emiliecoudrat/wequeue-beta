class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :description
      t.integer :duration
      t.string :picture

      t.timestamps
    end
  end
end
