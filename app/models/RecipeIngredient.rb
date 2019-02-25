# RecipeIngredient is the join between an ingredient and a recipe. This is a has-many-through relationship Build the following methods on the RecipeIngredient class

# RecipeIngredient.all should return all of the RecipeIngredient instances
# RecipeIngredient#ingredient should return the ingredient instance
# RecipeIngredient#recipe should return the recipe instance
class RecipeIngredient
    attr_reader :recipe, :ingredient
    @@all = []

    def initialize(recipe, ingredient)
        @recipe = recipe
        @ingredient = ingredient
        @@all << self
    end

    def self.all
        @@all
    end
end