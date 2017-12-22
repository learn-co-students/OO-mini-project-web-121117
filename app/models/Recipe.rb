class Recipe
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def self.create(name)
    new_recipe = Recipe.new(name)
    new_recipe.save
    new_recipe
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    highest = 0
    highest_recipe = nil
    Recipe.all.each do |recipe|
      count = 0
      RecipeCard.all.each do |card|
        count += 1 if card.recipe == recipe
        if count > highest
          highest = count
          highest_recipe = recipe
        end
      end
    end
    highest_recipe
  end

  def users
    results = []
    User.all.each do |user|
      user.recipes.each do |recipe_card|
        results << recipe_card.user if recipe_card.recipe == self
      end
    end
    results
  end

  def ingredients
    all_ingredients = RecipeIngredient.all
    relevent_ingredients = all_ingredients.select do |recipe_ingredient|
      recipe_ingredient.recipe == self
    end
    relevent_ingredients.map(&:ingredient)
  end

  def allergens
    all_in = []
    ingredients.each do |ingredient|
      Allergen.all.each do |allergen|
        all_in << ingredient if ingredient == allergen.ingredient
      end
    end
    all_in.uniq
  end

  def add_ingredients(ingredient_array)
    ingredient_array.each do |ingredient|
      RecipeIngredient.create(self, ingredient)
    end
  end
end
