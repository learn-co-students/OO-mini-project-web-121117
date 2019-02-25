require 'date'

# A RecipeCard is the join between a user instance and a recipe instance. This
# is a has-many-through relationship. Build the following methods on the
# RecipeCard class:

# RecipeCard.all should return all of the RecipeCard instances
# RecipeCard#date should return the date of the entry
# RecipeCard#rating should return the rating (an integer) a user has given their entry
# RecipeCard#user should return the user to which the entry belongs
# RecipeCard#recipe should return the recipe to which the entry belongs
class RecipeCard
    attr_reader :user, :rating, :recipe, :date
    @@all = []

    def initialize(user, recipe, rating, date)
        @user = user
        @recipe = recipe
        @rating = rating
        @date = date
        @@all << self
    end

    def self.all
        @@all
    end
end