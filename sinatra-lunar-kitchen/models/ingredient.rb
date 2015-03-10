class Ingredient

#Constructor
  attr_reader :name

  def initialize(name, recipe_id)
    @name = name
    @recipe_id = recipe_id
  end

  def self.all
    sql_recipe_name = "SELECT * FROM ingredients ORDER BY ingredients.name;"
    all_ingredients = self.db_connection { |conn| conn.exec(sql_recipe_name)}.to_a

    @ingredients = []
    all_ingredients.each do |ingredient|
      @ingredients << Ingredients.new(ingredient["name"], ingredient["recipe_id"])
    end
    @ingredients
  end


  def self.find(recipe_id)
    @found_ingredients = []
    @ingredients.each do |ingredient|
      if ingredients.id == recipe_id
        @found_ingredients << ingredient
      end
    end
    @found_ingredients
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




  # def ingredients(recipe_id)
  #   sql_ingredients = <<-eos
  #   SELECT ingredients.name AS ingredient FROM ingredients
  #     FULL OUTER JOIN recipes ON recipes.id = ingredients.recipe_id
  #     WHERE recipes.id = $1;
  #     eos
  #     ingredients = self.db_connection { |conn| conn.exec(sql_ingredients, [recipe_id]).to_a}
  #
  #     @all_ingredients = []
  #     ingredients.each do |ingredient|
  #       @all_ingredients << Ingredient.new(ingredient["id"], ingredient["name"],ingredient["recipe_id"])
  #     end
  #     @all_ingredients
  # end
  #
