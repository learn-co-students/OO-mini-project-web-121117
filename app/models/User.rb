require 'pry'

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

  def add_recipe_card(recipe_instance, date, rating)

    new_recipe = RecipeCard.new(recipe_instance, date, rating, self)
  end

  def declare_allergen(ingredient_instance)
    new_allergen = Allergen.new(self, ingredient_instance)
  end

  def recipes
    relevant_recipes = RecipeCard.all.select do |recipe_card|
      recipe_card.user == self
    end
    relevant_recipes.map do |relevant_recipe|
      relevant_recipe.recipe
    end
  end

  def top_three_recipes

    users_recipe_cards = RecipeCard.all.select do |recipe_card|
      recipe_card.user == self
    end
    # top_recipes_hash = Hash.new(0)
    sorted = users_recipe_cards.sort_by do |users_recipe_card|
      users_recipe_card.rating
    end
    sorted.reverse[0..2].map do |sorted_cards|
      sorted_cards.recipe
    end

  end

  def most_recent_recipe
    users_recipe_cards = RecipeCard.all.select do |recipe_card|
      recipe_card.user == self
    end
    users_recipe_cards[-1].recipe
  end

end
