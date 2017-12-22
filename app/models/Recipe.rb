class Recipe

  @@all = [] #hold all recipes
  attr_accessor :allergens

  def initialize()
    @@all << self
  end

  def self.all #class method reading the recipes
    @@all
  end

  def self.most_popular #have to look at ALL recipes so looking through the class array
     recipe_most_pop = {}
    RecipeCard.all.each do |recipe_card|
    if recipe_most_pop.keys.include?(recipe_card.recipe)
      recipe_most_pop[recipe_card.recipe] +=1 #accessing the key in our hash and incrementing the value by 1
    else
      recipe_most_pop[recipe_card.recipe] = 1
    end
  end
    most_pop_recipe = recipe_most_pop.max_by { |key , value| value }
    #most_pop_recipe[0]
  end

   def users
     recipe_card_user = RecipeCard.all.select do |recipe_card|
       recipe_card.recipe == self
    end
     recipe_card_user.map {|card| card.user}
   end

  def add_ingredients(array_of_ingredients)
    array_of_ingredients.each do |ingredient|
      ri = RecipeIngredient.new
      ri.ingredient = ingredient
      ri.recipe = self
    end
  end

  def ingredients
    RecipeIngredient.all.collect do |ri|
      if ri.recipe = self
        ri.ingredient
      end
    end
  end

  def allergens
    recipe_ingredients = self.ingredients
     allergen_ingredient = Allergen.all.select do | allerg |
     recipe_ingredients.include?(allerg.ingredient)
     end
    #should return all of the ingredients in this recipe that are allergens
     allergen_ingredient.map do | attributes |
       attributes.ingredient
  end
end


end
