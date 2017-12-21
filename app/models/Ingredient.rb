class Ingredient
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def most_common_allergen
    sorted = Allergen.all.sort_by do |allergen|
      Allergen.all.count(allergen.ingredient)
    end
    sorted[-1].ingredient
  end
end
