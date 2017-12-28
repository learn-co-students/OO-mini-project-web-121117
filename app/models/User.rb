class User

  @@all = []

  def recipes
    relavent_card = RecipeCard.all.select { |recipe_card| recipe_card.user == self }
    relavent_card.collect { |recipe_card| recipe_card.ingredient}
  end

  def add_recipe_card(recipe)
    RecipeCard.create(self, recipe)
  end

  def most_recent_recipe
    user_recipes = RecipeCard.all.select { |card| card.user == self}
    user_recipes[-1]
  end

  def declare_allergen(ingredient)
    new_allergen = Allergen.create(ingredient, self)
  end

  def allergens
    all_allergens = Allergen.all.select { |allergen| allergen.user == self}
    all_allergens.collect { |allergen| allergen.ingredient}
  end

  def top_three_recipes
    user_counter = {}
    RecipeCard.all.each do |card|
      if user_counter.keys.include?(card.recipe)
        user_counter[card.recipe] += 1
      else
        user_counter[card.recipe] = 1
      end
    end
    most_common = user_counter.max_by { |k, v| v }
    most_common[0]
  end

  def most_recent_recipe
    all_cards = RecipeCard.All.select {|card| card.user == self}
    all_cards[-1]
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create
    noob = User.new
    noob.save
    noob
  end

end
