class UpdateColumnsInMembers < ActiveRecord::Migration
  def change
    remove_column :members, :users_id
    remove_column :members, :meetups_id

    add_column :members, :user_id, :integer
    add_column :members, :meetup_id, :integer
  end
end
