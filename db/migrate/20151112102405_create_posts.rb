class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :user
      t.integer :other_user_id
      t.text :text
      t.decimal :latitude
      t.decimal :longitude
      t.string :image

      t.timestamps null: false
    end
  end
end
