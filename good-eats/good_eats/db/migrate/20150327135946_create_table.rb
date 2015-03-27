class CreateTable < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zipcode, null: false
      t.string :description
      t.string :category

      t.timestamps
    end

    create_table :reviews do |t|
      t.string :body, null: false
      t.integer :rating, null: false
      t.integer :restaurant_id, null: false

      t.timestamps null: false
    end

  end
end
