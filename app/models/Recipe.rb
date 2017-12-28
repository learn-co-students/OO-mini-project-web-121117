class Recipe

  @@all = []

  def save
    @@all << self
  end


  def ingredients
    relavent_ris = RecipeIngredient.all.select { |ri| ri.recipe == self }
    relavent_ris.collect { |ri| ri.ingredient}
  end

  def add_ingredients(ingredient_array)
    ingredient_array.each { |ingredient| RecipeIngredient.create(self, ingredient) }
  end

  def users
    relevant_cards = RecipeCard.all.select do |recipe_card|
      recipe_card.recipe == self
    end
    relevant_cards.map {|card| card.user}
  end

  def allergens
    all_allergens = Allergens.all.select {|allergen| self.ingredients.include?(allergen)}
    all_allergens.collect {|allergen| allergen.ingredient}
  end

  def self.all
    @@all
  end

  def self.create
    noob = Recipe.new
    noob.save
    noob
  end

  def self.most_popular
    r_popularity = {}
    RecipeCard.all.each do |recipe_card|
      if r_popularity.keys.include?(recipe_card.recipe)
        r_popularity[recipe_card.recipe] += 1
      else
        r_popularity[recipe_card.recipe] = 1
      end
    end
    most_popular = r_popularity.max_by {|k,v| v}
    most_popular[0]
  end

end
