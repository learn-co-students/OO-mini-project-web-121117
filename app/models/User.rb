class User
  attr_reader :name, :allergens

  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    recipe_card = RecipeCard.all.select {|recipe_card| recipe_card.user == self }
    recipe_card.map {|recipe_card| recipe_card.recipe}
  end

  def add_recipe_card(recipe, rating)
    date = Time.now
    new_recipe_card = RecipeCard.new(self, recipe, date, rating)

  end

  def declare_allergen(ingredient)
    new_allergen = Allergen.new(ingredient, self)
  end

  def allergens
    allergy = Allergen.all.select { |allergen| allergen.user == self }
    allergy.map {|allergen| allergen.ingredient}
  end

  def top_three_recipes
    top_three = RecipeCard.all.sort_by do |recipe_card|
      recipe_card.rating
    end
    top_three.reverse.map { |recipe_card| recipe_card.recipe }[0..2].uniq
  end

  def most_recent_recipe
    recipe_card = RecipeCard.all.select {|recipe_card| recipe_card.user == self }
    recipe_card.last.recipe
  end

  def safe_recipes
    safe = []
    allergies = self.allergens
    allergies.each { |allergy| Recipe.all.each {|recipe| safe << recipe if !recipe.ingredients.include?(allergy)} }
    safe.empty? ? Recipe.all : safe
  end


end
