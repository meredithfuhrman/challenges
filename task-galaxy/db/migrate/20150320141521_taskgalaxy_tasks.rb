class TaskgalaxyTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.string :description
      t.datetime :due_date

      t.timestamps
    end
  end
end
