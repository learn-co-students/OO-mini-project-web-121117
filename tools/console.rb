require_relative '../config/environment.rb'

tomato = Ingredient.new("tomato")
flour = Ingredient.new("flour")
butter = Ingredient.new("butter")

soup = Recipe.new("soup")
cake = Recipe.new("cake")
pizza = Recipe.new("pizza")
cookies = Recipe.new("cookies")
salad = Recipe.new("salad")

lindsay = User.new("Lindsay")
ian = User.new("Ian")
blake = User.new("Blake")
brent = User.new("Brent")

rc1 = RecipeCard.new(soup, lindsay, 7)
rc2 = RecipeCard.new(pizza, lindsay, 9)
rc3 = RecipeCard.new(cake, lindsay, 3)
rc4 = RecipeCard.new(pizza, ian, 6)
rc5 = RecipeCard.new(soup, ian, 4)
rc6 = RecipeCard.new(cake, ian, 7)
rc7 = RecipeCard.new(soup, blake, 2)
rc8 = RecipeCard.new(cake, blake, 9)
rc9 = RecipeCard.new(pizza, blake, 10)
rc10 = RecipeCard.new(cookies, blake, 8)
rc11 = RecipeCard.new(salad, blake, 1)
rc13 = RecipeCard.new(soup, brent, 5)

ri1 = RecipeIngredient.new(soup, tomato)
ri2 = RecipeIngredient.new(soup, butter)

a1 = Allergen.new(lindsay, tomato)
a2 = Allergen.new(blake, tomato)
a3 = Allergen.new(ian, butter)

binding.pry
