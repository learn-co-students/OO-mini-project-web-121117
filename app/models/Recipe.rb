class Recipe
  attr_accessor :ingredients, :allergens, :name, :users
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def ingredients
    RecipeIngredients.all.map {|ingredient| ingredient.name if ReceipeIngredients.recipe == self}
  end

  def self.most_popular
    most_popular_hash = Hash.new(0)
    RecipeCard.all.each do |recipe_card|
      most_popular_hash[recipe_card.recipe] += 1
    end

    most_popular_hash.each do |recipe ,count|
      return recipe.name if count == most_popular_hash.values.max
    end
  end

  def users
    RecipeCard.all.select { |recipe_card| recipe_card.user if recipe_card.recipe == self}
  end


  def allergens
    ingredients = RecipeIngredient.all.map {|ri| ri.ingredient}
    Allergen.all.map {|allergen| allergen.ingredient if ingredients.include?(allergen.ingredient)}
  end

  def add_ingredients(ingredients_array)
    ingredients_array.each { |ingredient| RecipeIngredient.new(self, ingredient) }
  end

end
