require_relative '../config/environment.rb'
require_relative '../app/models/User.rb'
require_relative '../app/models/Recipe.rb'
require_relative '../app/models/RecipeCard.rb'
require_relative '../app/models/Ingredient.rb'
require_relative '../app/models/RecipeIngredient.rb'
require_relative '../app/models/Allergen.rb'

joe = User.create("Joseph")
mark = User.create("Mark")
gumbo = Recipe.new("Gumbo")
bisque = Recipe.new("bisque")
chicken = Recipe.new("chicken")
beef = Recipe.new("beef")
ia = Ingredient.new("Okra")
ib = Ingredient.new("Onion")
ic = Ingredient.new("pepper")
id = Ingredient.new("Celery")

ria = RecipeIngredient.create(ia,gumbo)

gumbo.add_ingredients([ia,ib,ic,id])
bisque.add_ingredients([ib])
chicken.add_ingredients([ib,ic,id])
beef.add_ingredients([ib,ic,id])


joe.add_recipe_card(gumbo, 10)
mark.add_recipe_card(bisque, 4)
mark.add_recipe_card(gumbo, 8)
mark.add_recipe_card(chicken, 2)
mark.add_recipe_card(beef, 6)


joe.declare_allergen(ib)
joe.declare_allergen(ic)
mark.declare_allergen(ia)
mark.declare_allergen(id)

gumbo.allergens

gumbo.ingredients

mark.top_three_recipes

mark.safe_recipes

# mark.most_recent_recipe

binding.pry
