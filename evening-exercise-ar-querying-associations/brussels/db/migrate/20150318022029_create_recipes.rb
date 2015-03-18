class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |table|
      table.string :name, null: false
      table.text :description, null: false
      table.text :instructions, null: false
      table.text :ingredients, null: false

      table.timestamps
    end
  end
end
