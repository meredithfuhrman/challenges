class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |table|
      table.integer :users_id, null: false
      table.integer :meetups_id, null: false

      table.timestamps
    end
  end
end
