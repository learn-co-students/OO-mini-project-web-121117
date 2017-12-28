require_relative '../config/environment.rb'


rick = User.create

pasta = Recipe.create
grilled_cheese = Recipe.create
pizza = Recipe.create


cheese = Ingredient.create
tomato = Ingredient.create
bread = Ingredient.create
spaghetti = Ingredient.create

ri1 = RecipeIngredient.create(pasta, spaghetti)
ri2 = RecipeIngredient.create(pasta, tomato)
ri3 = RecipeIngredient.create(pasta, cheese)
ri4 = RecipeIngredient.create(grilled_cheese, bread)
ri5 = RecipeIngredient.create(grilled_cheese, cheese)


ing_arr = [cheese, tomato, bread]

rc = RecipeCard.create(rick, grilled_cheese)


binding.pry
