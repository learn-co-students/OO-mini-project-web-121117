class Recipe
    attr_reader :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    # Recipe.all should return all of the recipe instances
    def self.all
        @@all
    end

    # Recipe#users should return the user instances who have recipe cards with this
    #   recipe
    def users
        RecipeCard.all.select do |card|
            card.recipe == self
        end.map do |card|
            card.user
        end
    end

    # Recipe#ingredients should return all of the ingredients in this recipe
    def ingredients
        RecipeIngredients.all.select do |recipe_ingredient|
            recipe_ingredient.recipe == self
        end.map do |recipe_ingredient|
            recipe_ingredient.ingredient
        end
    end

    # Recipe#allergens should return all of the ingredients in this recipe that are
    #   allergens
    def allergens
    end

    # Recipe#add_ingredients should take an array of ingredient instances as an
    #   argument, and associate each of those ingredients with this recipe
    def add_ingredients(ingredients)
        ingredients.each do |ingredient|
            RecipeIngredient.new(self, ingredient)
        end
    end

    # Recipe.most_popular should return the recipe instance with the highest number
    #   of users (the recipe that has the most recipe cards)
    def self.most_popular
    end
end