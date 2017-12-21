require_relative '../config/environment.rb'

paul = User.create("Paul")
shiela = User.create("Shiela")
antonine = User.create("Antonine")

apples = Ingredient.create("apple")
crust = Ingredient.create("crust")
whip_creme = Ingredient.create("whip creme")

egg = Ingredient.create("egg")
milk = Ingredient.create("milk")
cheese = Ingredient.create("cheese")
salt = Ingredient.create("salt")
pepper = Ingredient.create("pepper")

green_beans = Ingredient.create("green beans")
fried_onions = Ingredient.create("fried onions")

peanut_butter = Ingredient.create("peanut butter")
jelly = Ingredient.create("jelly")
bread = Ingredient.create("bread")



apple_pie = Recipe.create("Apple Pie")
breakfast_pizza = Recipe.create("Breakfast Pizza")
green_bean_casserole = Recipe.create("Green Bean Casserole")
pb_j = Recipe.create("PB & J")
pasta = Recipe.create("Pasta")
cake = Recipe.create("Cake")


paul.add_recipe_card(apple_pie, 5)
paul.add_recipe_card(breakfast_pizza, 3)
paul.add_recipe_card(green_bean_casserole, 1)
paul.add_recipe_card(pb_j, 2)

shiela.add_recipe_card(pasta, 3)
shiela.add_recipe_card(apple_pie, 4)

antonine.add_recipe_card(apple_pie, 2)
antonine.add_recipe_card(cake, 5)
antonine.add_recipe_card(breakfast_pizza, 4)

shiela.declare_allergen(peanut_butter)
paul.declare_allergen(peanut_butter)
antonine.declare_allergen(peanut_butter)
antonine.declare_allergen(jelly)

pizza_array = [cheese, milk, salt, pepper, egg]
pb_j_array = [peanut_butter, jelly, bread]
pb_j.add_ingredients(pb_j_array)

# apple_pie = Recipe.create("")

User.all

binding.pry
