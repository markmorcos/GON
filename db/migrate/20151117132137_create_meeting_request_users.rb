class CreateMeetingRequestUsers < ActiveRecord::Migration
  def change
    create_table :meeting_request_users do |t|
      t.belongs_to :meeting_request
      t.belongs_to :user
      t.integer :accepted, default: 0

      t.timestamps null: false
    end
  end
end
