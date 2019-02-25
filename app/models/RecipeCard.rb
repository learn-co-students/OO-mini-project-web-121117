require 'date'

# A RecipeCard is the join between a user instance and a recipe instance. This
# is a has-many-through relationship.
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