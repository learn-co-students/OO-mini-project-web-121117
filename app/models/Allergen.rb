# An Allergen is a join between a user and an ingredient. This is a
# has-many-through relationship. What methods should an instance of this model
# respond to?
class Allergen
    attr_reader = :user, :ingredient
    @@all = []

    def initialize(user, ingredient)
        @user = user
        @ingredient = ingredient
        @@all << self
    end

    def self.all
        @@all
    end
end