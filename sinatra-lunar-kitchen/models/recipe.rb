#Method to open connection to Recipes databases
def db_connection
  begin
    connection = PG.connect(dbname: "recipes")
    yield(connection)
  ensure
    connection.close
  end
end


class Recipe
#Constructor
  def initialize(id, name, instructions, description)
    @id = id
    @name = name
    @instructions = instructions
    @description = description
    @ingredients = Array.new
  end

  attr_reader :id, :name, :instructions, :description

#Class methods
  def self.all
    sql_recipe_name = "SELECT * FROM recipes ORDER BY recipes.name;"
    recipes = db_connection { |conn| conn.exec(sql_recipe_name)}.to_a

    all_recipes = []
    recipes.each do |recipe|
      all_recipes << Recipe.new(recipe["id"], recipe["name"],recipe["instructions"],recipe["description"])
    end
    all_recipes
  end


  def self.find(id)
    
  end

end

# def get_recipe_details(recipe_id)
#   sql_recipe_details = <<-eos
#   SELECT recipes.name, recipes.description, recipes.instructions
#     FROM recipes WHERE recipes.id = $1;
#     eos
#     db_connection {|conn| conn.exec(sql_recipe_details, [recipe_id]).to_a}
# end
#
# def get_ingredients(recipe_id)
#   sql_ingredients = <<-eos
#   SELECT ingredients.name AS ingredient
#     FROM ingredients
#     FULL OUTER JOIN recipes ON recipes.id = ingredients.recipe_id
#     WHERE recipes.id = $1;
#     eos
#     db_connection { |conn| conn.exec(sql_ingredients, [recipe_id]).to_a}
# end
