



class User

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def self.create(name)
    new_user = self.new(name)
    new_user.save
  end

  def add_recipe_card(recipe_instance, rating)
    date = Time.now
    # user_instance = self
    new_recipe_card = RecipeCard.new(recipe_instance, self, date, rating)
    new_recipe_card.save
  end

  def declare_allergen(ingredient_instance)
    new_allergen = Allergen.create(ingredient_instance, self)
  end

  def allergens
    h = []
    Allergen.all.each do |allergen_instance|
      if allergen_instance.user == self
        h << allergen_instance.ingredient
      end
    end
    h
  end

  def recipes
    self.recipe_cards.map do |recipecard_instance|
      recipecard_instance.recipe
    end
  end

  def safe_recipes
    user_recipes = self.recipes
    user_allergens = self.allergens
    h = user_recipes.select do |recipe_instance|
      ((recipe_instance.ingredients & user_allergens).length == 0)
    end
    h
  end

  def save
    @@all << self
    self
  end

  def self.all
    @@all
  end

  def recipe_cards
    h = RecipeCard.all.select do |rio|
      rio.user == self
    end
  end

  def top_three_recipes
    sorted_cards = self.recipe_cards.sort_by do |recipe_card|
      recipe_card.rating
    end
    result = sorted_cards.reverse.slice(0..2)
    result = result.map do |recipe_card|
      recipe_card.recipe
    end
    result
  end

  def most_recent_recipe
    sorted_recipes = self.recipe_cards.sort_by do |recipe_card|
      recipe_card.date
    end
    sorted_recipes[-1].recipe
  end

end
