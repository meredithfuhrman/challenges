class Recipe
  attr_reader :id, :name, :instructions, :description

  def initialize(id, name, instructions, description)
    @id = id
    @name = name
    @instructions = instructions
    @description = description
  end
 
  def self.all
    sql_recipe_name = "SELECT * FROM recipes ORDER BY recipes.name;"
    recipes = db_connection { |conn| conn.exec_params(sql_recipe_name)}.to_a
    @recipes = []
    recipes.each do |recipe|
      @recipes << Recipe.new(recipe["id"], recipe["name"],recipe["instructions"],recipe["description"])
    end
    @recipes
  end

  def self.find(id)
    sql = "SELECT * FROM recipes WHERE id = $1"
    recipe = db_connection { |conn| conn.exec_params(sql, [id])}.first
    if 
    Recipe.new(id, "Error", "This recipe doesn't have any instructions.",
          "This recipe doesn't have a description.")
  end

  def ingredients
    @ingredients = Array.new
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
