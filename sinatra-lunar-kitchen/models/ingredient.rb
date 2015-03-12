class Ingredient

#Constructor
  attr_reader :name, :id

  def initialize(name, recipe_id)
    @name = name
    @id = recipe_id
  end
end
