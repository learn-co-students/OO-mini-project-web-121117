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
        if card.recipe == recipe 
          count += 1 
        end 
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
        if recipe_card.recipe == self 
           results << recipe_card.user
        end
      end 
    end
    results
  end


  #   User.all.collect do |user|
  #     user.recipes.include?(self)
  #   end
  #   results
  # end 

  # User.all.collect do |user|
  #   user.recipes.recipe == self 
  # end

  # User.all.each do |user|
  #   user.recipes.each do |recipe_card|
  #     if recipe_card.recipe == self 
  #       results << recipe_card.user
  #     end
  #   end 
  # end

  def ingredients
    all_ingredients = RecipeIngredient.all 
    relevent_ingredients = all_ingredients.select do |recipe_ingredient|
      recipe_ingredient.recipe == self 
    end 
    relevent_ingredients.map do |ri|
      ri.ingredient 
    end 
  end

  def allergens
    all_in = []
    self.ingredients.each do |ingredient|
      Allergen.all.each do |allergen|
        if ingredient == allergen.ingredient
          all_in << ingredient
        end
      end 
    end 
    all_in.uniq
  end 

  def add_ingredients(ingredient_array)
    ingredient_array.each do |ingredient|
      ingredient = RecipeIngredient.create(self, ingredient)
    end 
  end
end