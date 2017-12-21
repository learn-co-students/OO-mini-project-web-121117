class User
  attr_accessor :name, :recipe_card, :allergen
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end


  def self.all
    @@all
  end


  def recipes
    RecipeCard.all.map { |recipe_card| recipe_card.recipe if recipe_card.user == self }
  end


  def add_recipe_card(recipe, rating)
    new_recipe_card = RecipeCard.new(recipe, rating, self)
  end


  def declare_allergen(ingredient)
    new_allergen = Allergen.new(ingredient, self)
  end


  def allergens
    Allergen.all.select { |allergen| allergen if allergen.user == self }
  end


  def top_three_recipes
    top_three = RecipeCard.all.sort_by { |recipe_card| recipe_card.rating if recipe_card.user == self}
    top_three.reverse.map { |recipe_card| recipe_card.recipe }[0..2]
  end


  def most_recent_recipe
    @recipe_card.last.recipe
  end


end
