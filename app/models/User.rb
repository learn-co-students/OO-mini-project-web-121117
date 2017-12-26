class User
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    relevant_recipes = RecipeCard.all.select {|rc| rc.user == self}
    relevant_recipes.map {|rc| rc.recipe}
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(recipe, self, date, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    relevant_allergens = Allergen.all.select {|a| a.user == self}
    relevant_allergens.map {|a| a.ingredient}
  end

  def top_three_recipes
    relevant_recipes = RecipeCard.all.select {|r| r.user == self}
    sorted = relevant_recipes.sort_by {|r| r.rating}
    sorted_array = sorted.map {|r| r.recipe}
    sorted_array.slice(-3..-1).reverse
  end

  def most_recent_recipe
    relevant_recipes = RecipeCard.all.select {|r| r.user == self}
    sorted = relevant_recipes.sort_by {|r| r.date}
    sorted_array = sorted.map {|r| r.recipe}
    sorted_array[-1]
  end
end
