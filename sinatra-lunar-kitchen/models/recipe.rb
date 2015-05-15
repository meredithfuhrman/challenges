class Recipe
  attr_reader :id, :name, :instructions, :description, :ingredients

  def initialize(id, name, instructions = nil, description = nil, ingredients = [])
    @id = id
    @name = name
    @instructions = instructions
    @description = description
    @ingredients = ingredients
  end

  def self.all
    recipes = []
    sql = "SELECT id, name FROM recipes ORDER BY recipes.name"
    recipes = db_connection { |conn| conn.exec_params(sql)}.to_a
    recipes.map { |recipe| Recipe.new(recipe["id"], recipe["name"]) }
  end

  def self.find(id)
    recipe = nil
    ingredients = nil

    sql1 = "SELECT * FROM recipes WHERE id = $1"
    sql2 = "SELECT name FROM ingredients WHERE recipe_id = $1"

    db_connection do |conn|
      recipe = conn.exec_params(sql1, [id]).first
      ingredients = conn.exec_params(sql2, [id]).to_a
    end

    ingredients.map! { |ingredient| Ingredient.new(ingredient["name"], ingredient["recipe_id"])}

    if recipe.nil?
      recipe = Recipe.new(id, "Error", "This recipe doesn't have any instructions.",
        "This recipe doesn't have a description.")
    else
      recipe = Recipe.new(recipe["id"], recipe["name"],recipe["instructions"],recipe["description"], ingredients)
    end
    recipe
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

