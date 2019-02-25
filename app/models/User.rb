class User
    @@all = []
    def initialize()
        @@all << self
    end

    # User.all should return all of the user instances
    def self.all
        @@all
    end

    # User#recipes should return all of the recipes this user has recipe cards for
    def recipes
        RecipeCard.select do |recipe_card|
            recipe_card.user == self
        end.map do |card|
            card.recipe
        end
    end

    # User#allergens should return all of the ingredients this user is allergic to
    def allergens
        Allergen.select do |allergen|
            allergen.user == self
        end.map do |allergen|
            allergen.ingredient
        end
    end

    # User#add_recipe_card should accept a recipe instance as an argument, as
    # well as a date and rating, and create a new recipe card for this user and
    # the given recipe
    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(user, recipe, date, rating)
    end

    # User#declare_allergen should accept an ingredient instance as an argument, and create a new allergen instance for this user and the given ingredient
    def declare_allergen(ingredient)
        Allergen.new(user, ingredient)
    end

    # User#top_three_recipes should return the top three highest rated recipes for this user.
    def top_three_recipes
    end

    # User#most_recent_recipe should return the recipe most recently added to the user's cookbook.
    def most_recent_recipe
    end
end