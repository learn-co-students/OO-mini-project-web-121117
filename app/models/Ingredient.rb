class Ingredient
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    # Ingredient.most_common_allergen should return the ingredient instance that
    # the highest number of users are allergic to
    def self.most_common_allergen
        tally = {}
        most = nil
        Allergen.all.each do |ingredient|
            if tally[ingredient] == nil
                tally[ingredient] = 0
            end
            tally[ingredient] += 1

            if most == nil || tally[ingredient] > tally[most]
                most = ingredient
            end
        end
        most.ingredient
    end

    def to_s
        @name
    end
end