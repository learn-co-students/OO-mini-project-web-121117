require_relative '../config/environment.rb'



john = User.new
andrea = User.new

pasta = Recipe.new
pizza = Recipe.new
fries = Recipe.new

pasta_card = RecipeCard.new
pasta_card.user = john
pasta_card.recipe = pasta

pasta_card2 = RecipeCard.new
pasta_card2.user = john
pasta_card2.recipe = pasta

fries_card = RecipeCard.new
fries_card.user = andrea
fries_card.recipe = fries

potato = Ingredient.new
tomato = Ingredient.new
cheese = Ingredient.new

dairy = Allergen.new
dairy.user = john
dairy.ingredient = cheese
veggies = Allergen.new
veggies.user = andrea
veggies.ingredient = potato

veggies2 = Allergen.new
veggies2.user = john
veggies2.ingredient = potato

recipe_ingredients = RecipeIngredient.new
recipe_ingredients.recipe = fries
recipe_ingredients.ingredient = potato

binding.pry
