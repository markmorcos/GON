class CreateMeetingRequests < ActiveRecord::Migration
  def change
    create_table :meeting_requests do |t|
      t.belongs_to :user
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps null: false
    end
  end
end
