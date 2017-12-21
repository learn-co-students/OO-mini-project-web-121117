class RecipeIngredient
  
  attr_accessor :ingredient, :recipe

  @@all = []

  def initialize(ingredient_instance, recipe_instance)
    @ingredient = ingredient_instance
    @recipe = recipe_instance
  end

  def self.create(ingredient_instance, recipe_instance)
    new_recipe_ingredient = RecipeIngredient.new(ingredient_instance, recipe_instance)
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
