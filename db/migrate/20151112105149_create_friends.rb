class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.belongs_to :user
      t.integer :other_user_id
      t.boolean :accepted, default: false

      t.timestamps null: false
    end
  end
end
