require_relative '../config/environment.rb'


# require_relative '../app/models/Allergen'
# require_relative '../app/models/Ingredient'
# require_relative '../app/models/Recipe'
# require_relative '../app/models/RecipeCard'
# require_relative '../app/models/RecipeIngredient'
# require_relative '../app/models/User'


#users
u = User.new('dingus')
user2 = User.new('Mingus')
user3 = User.new("Parker")

#recipes
best_recipe = Recipe.new('best recipe')
second_best_recipe = Recipe.new('second best recipe')
third_best_recipe = Recipe.new('third best recipe')
this_recipe_sucks = Recipe.new('bad recipe')
this_recipe_also_sucks = Recipe.new('bad recipe 2')

#ingredients
i = Ingredient.new('spice')
i2 = Ingredient.new('oregano')
i3 = Ingredient.new('spicy lettuce')

u.add_recipe_card(best_recipe, Time.now, 10)
u.add_recipe_card(second_best_recipe, Time.now, 9)
u.add_recipe_card(third_best_recipe, Time.now, 8)
u.add_recipe_card(this_recipe_sucks, Time.now, 7)
u.add_recipe_card(this_recipe_also_sucks, Time.now, 6)
user2.add_recipe_card(best_recipe, Time.now, 10)
u.add_recipe_card(second_best_recipe, Time.now, 9)
u.add_recipe_card(third_best_recipe, Time.now, 8)
u.add_recipe_card(this_recipe_sucks, Time.now, 7)
u.add_recipe_card(this_recipe_also_sucks, Time.now, 6)
user3.add_recipe_card(best_recipe, Time.now, 10)



u.declare_allergen(i)
user2.declare_allergen(i)
user3.declare_allergen(i)
u.declare_allergen(i2)
user2.declare_allergen(i3)
user3.declare_allergen(i3)

ingredient_soup = [i, i2, i3]

best_recipe.add_ingredients(ingredient_soup)

# u.add_recipe_card(best_recipe, 9, 10)
# user2.add_recipe_card(best_recipe, 9, 10)
# u.add_recipe_card(second_best_recipe, 9, 9)
# u.add_recipe_card(third_best_recipe, 9, 8)
# u.add_recipe_card(this_recipe_sucks, 9, 1)
# user2.declare_allergen(i)
# user3.declare_allergen(i)
# user3.declare_allergen(i2)
# u.declare_allergen(i)
# u.declare_allergen(i3)
# u.declare_allergen(i2)

binding.pry
