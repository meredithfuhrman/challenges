class RemoveCreatedbyMeetups < ActiveRecord::Migration
  def change
    remove_column :meetups, :created_by
  end
end
