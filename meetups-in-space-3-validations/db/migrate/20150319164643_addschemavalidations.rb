class Addschemavalidations < ActiveRecord::Migration
  def up
    change_column :meetups, :created_by, :integer, null: false
    change_column :members, :user_id ,:integer, null: false
    change_column :members, :meetup_id ,:integer, null: false
  end
  def down
    change_column :meetups, :created_by, :integer
    change_column :members, :user_id ,:integer
    change_column :members, :meetup_id ,:integer
  end
end
