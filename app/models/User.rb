class User
  @@all = []

def initialize
 @@all << self
end

def self.all
  @@all
end

def recipes
  RecipeCard.all.collect do |recipe_card|
    if recipe_card.user == self
      recipe_card.recipe #returns an array of the all the recipes
    end
  end
end

def add_recipe_card(recipe, date, rating)
  new_recipe_card = RecipeCard.new
  new_recipe_card.recipe = recipe
  new_recipe_card.date = date
  new_recipe_card.rating = rating
  new_recipe_card.user = self
end

def declare_allergen(ingredient)
  new_allergen = Allergen.new
  new_allergen.ingredient = ingredient
  new_allergen.user = self
end

def allergens
  allergens.all.collect do |allergen|
    if allergen.user == self
      allergen.ingredient
    end
  end
end

def top_three_recipes
  sorted_cards = my_recipe_cards.sort {|x,y| x.rating <=> y.rating} #x&y are recipe cards - calling rating on the cards since it's already a instance variable
  sorted_cards.reverse
  sorted_cards[0..2]
end

def most_recent_recipe
  my_recipe_cards[-1].recipe
end

private

def my_recipe_cards
  RecipeCard.all.collect do |recipe_card|
    if recipe_card.user == self
      recipe_card
    end
  end
end


end
