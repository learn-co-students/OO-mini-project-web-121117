class User
  attr_accessor :name, :recipe_card, :allergen

  @@all = []
  def initialize(name)
    @name = name
    @@all << self
    @recipe_card = []
  end

  def self.all
    @@all
  end

  def recipes
    @recipe_card.map do |recipe_card|
      recipe_card.recipe
    end
  end

  def add_recipe_card(recipe, rating)
    new_recipe_card = RecipeCard.new(recipe, rating, self)
    @recipe_card << new_recipe_card
  end

  def declare_allergen(ingredient)
    new_allergen = Allergen.new(ingredient, self)
  end

  def allergens
    Allergen.all.select do |allergen|
      allergen if allergen.user == self
    end
  end

  def top_three_recipes
    top_three = @recipe_card.sort_by do |recipe_card|
      recipe_card.rating
    end

    top_three.reverse.map { |recipe_card| recipe_card.recipe }[0..2]
  end

  def most_recent_recipe
    @recipe_card.last.recipe
  end


end
