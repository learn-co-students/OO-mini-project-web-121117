class Recipe

  attr_accessor :recipe_name

  @@all = []

  def initialize(recipe_name)
    @recipe_name = recipe_name
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
    recipe_cards = RecipeCard.all.select {|recipe_card| recipe_card.recipe == self}
    recipe_cards.map{|recipe_card| recipe_card.user}
  end

  def ingredients
    recipe_ingre = RecipeIngredient.all.select {|recipe_ingre| recipe_ingre.recipe == self}
    recipe_ingre.map{|recipe_ingre| recipe_ingre.ingredient}
   end

  def allergens
    allergens = Allergen.all.select { |allergen| allergen.ingredient == self }
  end


  def add_ingredients(array_of_ingredients)
    array_of_ingredients.each{|ingredient| RecipeIngredient.new(ingredient, self)}
    self.ingredients
  end
end
