require_relative '../config/environment.rb'

grandma = User.new("Grandma")
grandpa = User.new("Grandpa")
steve = User.new("Steve")

popcorn = Ingredient.new("Popcorn")
butter = Ingredient.new("Butter")
marshmallow = Ingredient.new("Marshmallow")

eggs = Ingredient.new("Eggs")
bread = Ingredient.new("Bread")

hot_butter = Recipe.new("Hot Butter")
popcorn = Recipe.new("Plain Popcorn")
popcorn_balls = Recipe.new("Popcorn Balls")
french_bread = Recipe.new("French Bread")

hot_butter.add_ingredients([butter])
popcorn.add_ingredients([popcorn])
popcorn_balls.add_ingredients([popcorn, butter, marshmallow])
french_bread.add_ingredients([eggs, bread])

grandpa.declare_allergen(bread)

steve.add_recipe_card(popcorn_balls, '2019-02-14', 5)
steve.add_recipe_card(french_bread, '2016-02-14', 3)
steve.add_recipe_card(popcorn, '2016-02-14', 4)
steve.add_recipe_card(hot_butter, '2016-02-14', 1)

grandma.add_recipe_card(french_bread, '1950-06-23', 4)
grandma.add_recipe_card(popcorn, '1950-06-23', 4)

grandpa.add_recipe_card(popcorn, '1965-06-23', 4)

puts "all Steve's recipes"
puts steve.recipes
puts

puts "Steve's Allergens"
puts steve.allergens
puts

puts "Steve's top three recipes"
puts steve.top_three_recipes
puts

puts "Steve's most-recent recipe"
puts steve.most_recent_recipe
puts

puts "Grandpas Allergens"
puts grandpa.allergens
puts

puts "Most common Allergen"
puts Ingredient.most_common_allergen
puts

puts "Most Popular Recipe"
puts Recipe.most_popular
puts
