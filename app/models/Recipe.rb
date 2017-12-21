class Recipe
  attr_accessor :ingredients, :allergens, :name, :users
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @ingredients = []
  end

  def self.all
    @@all
  end

  def ingredients
    @ingredients.map {|ingredient| ingredient.name}
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
    RecipeCard.all.select do |recipe_card|
      if recipe_card.recipe == self
        recipe_card.user
      end
    end
  end

  # def allergens
  #   @ingredients.select do |ingredient|
  #     return ingredient if Allergen.all.include?(ingredient)
  #   end
  # end

  def allergens
    ingredients = RecipeIngredient.all.map {|ri| ri.ingredient}
    Allergen.all.map do |allergen|
      allergen.ingredient if ingredients.include?(allergen.ingredient)
    end
  end

  def add_ingredients(ingredients_array)
    ingredients_array.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
      @ingredients << ingredient
    end
  end

end
