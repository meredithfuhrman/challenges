class TaskgalaxyProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :description
      
      t.timestamps
    end
  end
end
