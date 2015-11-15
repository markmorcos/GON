class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :user
      t.integer :other_user_id
      t.text :text
      t.boolean :received, default: false
      t.boolean :read, default: false

      t.timestamps null: false
    end
  end
end
