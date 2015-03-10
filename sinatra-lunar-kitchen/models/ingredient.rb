class Ingredient

#Constructor
  attr_reader :name, :id

  def initialize(name, recipe_id)
    @name = name
    @id = recipe_id
  end

  def self.all
    sql_recipe_name = "SELECT * FROM ingredients ORDER BY ingredients.name;"
    all_ingredients = self.db_connection { |conn| conn.exec(sql_recipe_name)}.to_a

    @ingredients = []
    all_ingredients.each do |ingredient|
      @ingredients << Ingredient.new(ingredient["name"], ingredient["recipe_id"])
    end
    @ingredients
  end


  def self.find(recipe_id)
    @found_ingredients = []
    @ingredients.each do |ingredient|
      if ingredient.id == recipe_id
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
