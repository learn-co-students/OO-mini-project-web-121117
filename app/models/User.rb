class User
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name 
  end

  def self.create(new_user)
    new_user = User.new(new_user)
    new_user.save 
    new_user 
  end

  def self.all
    @@all
  end

  def save 
    @@all << self
  end

  def recipes 
    all_recipes = RecipeCard.all  
    relevent_recipes = all_recipes.select do |user_recipe| 
      user_recipe.user == self
    end
    relevent_recipes.map do |rc|
      rc.recipe
    end
  end

  def add_recipe_card(recipe, rating)
    recipe = RecipeCard.create(recipe, rating)
    recipe.user = self
    recipe.rating = rating
  end

  def declare_allergen(allergen)
    Allergen.create(allergen, self)
  end

  def allergens
    all_allergens = Allergen.all 
    relevent_allergens = all_allergens.select do |user_allergen|
      user_allergen.user == self 
    end 
    relevent_allergens.map do |ra|
      ra.allergen 
    end 
  end

  def top_three_recipes
    sorted_recipes_by_rating = []
    sorted_recipe_cards_by_rating = recipes.sort_by {|recipe| recipe.rating}
    sorted_recipe_cards_by_rating.each do |recipe_card|
      sorted_recipes_by_rating << recipe_card.recipe
    end
    sorted_recipes_by_rating.reverse.first(3)
  end

  def most_recent_recipe
    sorted_recipe_cards_by_date = recipes.sort_by {|recipe| recipe.date}
    sorted_recipe_cards_by_date.last
  end
end