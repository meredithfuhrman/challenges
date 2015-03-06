require 'sinatra'
require 'pg'

###########
# Methods #
###########

#Open connection to database
def db_connection
  begin
    connection = PG.connect(dbname: "recipes")
    yield(connection)
  ensure
    connection.close
  end
end

#Get main list of recipes
def get_recipe_list
sql_statement = <<-eos
SELECT recipes.name, recipes.id, COUNT (ingredients.name) AS ingredient_count
  FROM recipes
  FULL OUTER JOIN ingredients ON recipes.id = ingredients.recipe_id
  GROUP BY recipes.id
  ORDER BY recipes.name;
  eos
  db_connection { |conn| conn.exec(sql_statement)}.to_a
end

#Get information about recipe
def get_recipe_details
  sql_recipe_details = <<-eos
  SELECT recipes.name, recipes.description, recipes.instructions
    FROM recipes WHERE recipes.id = $1;
    eos
    db_connection {|conn| conn.exec(sql_recipe_details, [params[:id]]).to_a}
end

#Get list of ingredients for recipe details
def get_ingredients
  sql_ingredients = <<-eos
  SELECT ingredients.name AS ingredient
    FROM ingredients
    FULL OUTER JOIN recipes ON recipes.id = ingredients.recipe_id
    WHERE recipes.id = $1;
    eos
    db_connection { |conn| conn.exec(sql_ingredients, [params[:id]]).to_a}
end


##########
# Routes #
##########


#Display main page with all recipes
get '/recipes' do
  all_recipes = get_recipe_list

  erb :'index', locals: {recipes: all_recipes}
end

#Display page with details for specific recipe
get '/recipes/:id' do
  recipe_details = get_recipe_details
  ingredients = get_ingredients

  erb :'details', locals: {recipe_details: recipe_details, ingredients: ingredients}
end
