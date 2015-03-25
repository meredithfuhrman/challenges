class RemoveUser < ActiveRecord::Migration
  def change
    #had table "user" that didn't want b/c copied and pasted code from another project
    drop_table :user
  end
end
