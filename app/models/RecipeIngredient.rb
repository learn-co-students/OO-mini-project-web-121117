class RecipeIngredient
  attr_accessor :recipe, :ingredient

  @@all = []

  def initialize (recipe, ingredient)
    @recipe = recipe
    @ingredient = ingredient
  end

  def self.create(recipe, ingredient)
    new_recipe_ingredient = RecipeIngredient.new(recipe, ingredient)
    new_recipe_ingredient.save
  end

  def save
    @@all << self
    self
  end

  def self.all
    @@all
  end
end
