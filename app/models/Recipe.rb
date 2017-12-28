class Recipe

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    # @@all << self
  end

  def self.create (name)
    r = Recipe.new(name)
    r.save
  end

  def save
    @@all << self
  end

  def add_ingredients(ingredient_instances)
    ingredient_instances.each do |ingredient_instance|
      new_recipe_ingredients = RecipeIngredient.new(ingredient_instance, self)
    end
  end

  def ingredients
    relevant_recipes = RecipeIngredient.all.select do |relevant_recipe|
      relevant_recipe.recipe == self
    end
    relevant_recipes.map do |relevant_ingredient|
      relevant_ingredient.ingredient
    end
  end

  def allergens
    recipe_allergens = []
    recipe_ingredients = RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.recipe = self
    end
    recipe_ingredients.map! do |recipe_ingredient|
      recipe_ingredient.ingredient
    end
    parsed_allergen_ingredients = Allergen.all.map do |allergen|
      allergen.ingredient
    end
    recipe_ingredients.each do |recipe_ingredient|
      if parsed_allergen_ingredients.include?(recipe_ingredient)
        recipe_allergens << recipe_ingredient
      end
    end
    recipe_allergens
  end

  def users
    relevant_users = RecipeCard.all.select do |recipe_card|
      recipe_card.recipe == self
    end
    relevant_users.map do |relevant_user|
      relevant_user.user
    end
  end

  def self.all
    @@all
  end

  def self.most_popular
    top_users_hash = Hash.new(0)
    RecipeCard.all.each do |recipe_card|
      top_users_hash[recipe_card.recipe] += 1
    end
    top_users_hash.max_by {|recipe, count| count}
  end

end
