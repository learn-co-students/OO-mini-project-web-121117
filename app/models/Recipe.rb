class Recipe
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    count = 0
    popular_recipe = ""
    Recipe.all.each do |recipe|
      if recipe.users.length > count
        count = recipe.users.length
        popular_recipe = recipe
      end
    end
    popular_recipe
  end

  def users
    relevant_recipes = RecipeCard.all.select {|rc| rc.recipe == self}
    relevant_recipes.map {|rc| rc.user}
  end

  def ingredients
    relevant_ingredients = RecipeIngredient.all.select {|ri| ri.recipe == self}
    relevant_ingredients.map {|ri| ri.ingredient}
  end

  def allergens
    self.ingredients.select do |i|
      relevant_allergens = Allergen.all.select {|a| a.ingredient == i}
    end
    #should return all of the ingredients in this recipe that are allergens
  end

  def add_ingredients(ing_array)
    ing_array.each {|i| RecipeIngredient.new(self, i)}
  end
end
