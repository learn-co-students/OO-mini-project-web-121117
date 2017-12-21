require_relative '../config/environment.rb'

apple_pie = Recipe.new("apple_pie")
ice_cream = Recipe.new("ice_cream")

apple = Ingredient.new('apple')
sugar = Ingredient.new('sugar')
milk = Ingredient.new('milk')
vanilla = Ingredient.new('vanilla')
dough = Ingredient.new('dough')

apple_pie.add_ingredients([apple, sugar, dough])
ice_cream.add_ingredients([sugar, milk, vanilla])

kenny = User.new("kenny")
anna = User.new("anna")

anna.declare_allergen(vanilla)

kenny.add_recipe_card(apple_pie,  9)
anna.add_recipe_card(apple_pie, 10)
anna.add_recipe_card(ice_cream, 2)




binding.pry
