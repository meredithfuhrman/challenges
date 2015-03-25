class TaskgalaxyAddIdsProjects < ActiveRecord::Migration
  def up
    add_column :tasks, :user_id, :integer
    add_column :tasks, :task_id, :integer
  end

  def down
    remove_column :tasks, :user_id
    remove_column :tasks, :task_id
  end
end
