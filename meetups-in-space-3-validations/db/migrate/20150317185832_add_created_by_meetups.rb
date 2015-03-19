class AddCreatedByMeetups < ActiveRecord::Migration
  def change
    add_column :meetups, :created_by, :integer
  end
end
