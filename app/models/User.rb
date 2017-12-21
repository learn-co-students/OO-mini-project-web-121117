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

  def recipes
    relevant_rc = RecipeCard.all.select do |rc|
      rc.user == self
    end
    relevant_rc.map do |rc|
      rc.recipe
    end
  end

  def add_recipe_card(rating, recipe)
    RecipeCard.new(Time.now, rating, self, recipe)
  end

  def top_three_recipes
    sorted = self.recipes.sort_by do |recipe|
      self.recipes.count(recipe)
    end
    sorted[-3..-1]
  end

  def most_recent_recipe
    self.recipes[-1]
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    relevant_allergens = Allergen.all.select do |allergen|
      allergen.user == self
    end
    relevant_allergens.map do |ri|
      ri.ingredient
    end
  end
end
