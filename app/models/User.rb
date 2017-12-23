class User

  attr_accessor :user_name

  @@all = []

  def initialize(user_name)
    @user_name = user_name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    recipe_cards = RecipeCard.all.select {|recipe_card| recipe_card.user == self}
    recipe_card.map{|card| card.recipe}
  end

  def add_recipe_card(recipe, rating=nil)
    self.recipes << recipe
    recipe.users << self
    date = Time.now
    new_recipecard = RecipeCard.new(date, rating, self, recipe)
  end

  def declare_allergen(ingredient)
    new_allergen = Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.select {|allergen_card| allergen_card.user == self }
  end

  def top_three_recipes
    recipe_cards = RecipeCard.all.select {|recipe_card| recipe_card.user == self}
    sorted = recipe_cards.sort_by!{|card| card.rating}
    sorted_array = sorted.map{|card| card.recipe}
    sorted_array.slice(-3..-1)
  end

  def most_recent_recipe
    recipe_cards = RecipeCard.all.select {|recipe_card| recipe_card.user == self}
    sorted = recipe_cards.sort_by!{|card| card.date}
    sorted_array = sorted.map{|card| card.recipe}
    sorted_array.pop
  end

end
