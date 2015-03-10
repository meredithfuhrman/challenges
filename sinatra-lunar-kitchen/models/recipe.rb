class Recipe
#Constructor
  attr_reader :id, :name, :instructions, :description

  def initialize(id, name, instructions, description)
    @id = id
    @name = name
    @instructions = instructions
    @description = description
    @ingredients = Array.new
  end

#Class methods
  def self.all
    sql_recipe_name = "SELECT * FROM recipes ORDER BY recipes.name;"
    recipes = self.db_connection { |conn| conn.exec(sql_recipe_name)}.to_a

    @recipes = []
    recipes.each do |recipe|
      @recipes << Recipe.new(recipe["id"], recipe["name"],recipe["instructions"],recipe["description"])
    end
    @recipes
  end


  def self.find(recipe_id)
    @recipes.each do |row|
      return row if row.id == recipe_id
    end
    Recipe.new(recipe_id, "Error", "This recipe doesn't have any instructions.",
          "This recipe doesn't have a description.")
  end

  def ingredients
    Ingredient.all
    id = self.id
    @ingredients = Ingredient.find(id)
    @ingredients
  end


  def self.db_connection
    begin
      connection = PG.connect(dbname: "recipes")
      yield(connection)
    ensure
      connection.close
    end
  end

end
