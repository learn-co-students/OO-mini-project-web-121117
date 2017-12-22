class Recipe
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    sorted = self.all.sort_by do |recipe|
      self.all.count(recipe)
    end
    sorted[-1]
  end

  def users
    relevant_rc = RecipeCard.all.select do |rc|
      rc.recipe == self
    end
    relevant_rc.map do |rc|
      rc.user
    end
  end

  def ingredients
    relevant_ri = RecipeIngredient.all.select do |ri|
      ri.recipe == self
    end
    relevant_ri.map do |ri|
      ri.ingredient
    end
  end

  def add_ingredients(ingredient_array)
    ingredient_array.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end

  def allergens
    relevant_allergens = Allergen.all.select do |allergen|
      self.ingredients.include?(allergen.ingredient)
    end
    relevant_allergens.map do |allergen|
      allergen.ingredient
    end
  end

end
