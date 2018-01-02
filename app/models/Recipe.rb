class Recipe
  attr_reader :ingredients, :allergens, :name, :users
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def ingredients
    ri = RecipeIngredient.all.select {|ri| ri.recipe == self}
    ri.map {|ing| ing.ingredient}
  end

  def self.most_popular
    sorted = self.all.sort_by do |recipe|
      self.all.count(recipe)
    end
    sorted[-1]
  end

  def users
    rc = RecipeCard.all.select{ |recipe_card| recipe_card.recipe == self }
    rc.map {|r| r.user }
  end

  def allergens
    ra = Allergen.all.select {|allergen| self.ingredients.include?(allergen.ingredient)}
    ra.map {|allergen| allergen.ingredient}
  end

  def add_ingredients(ingredients_array)
    ingredients_array.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end

end
