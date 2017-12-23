class Ingredient

  attr_reader :ingredient

  @@all = []

  def initialize(ingredient)
    @ingredient = ingredient
    @@all << self
  end

  def self.all
   @@all
  end

  def self.most_common_allergen
    hash = Hash.new(0)
      Allergen.all.each do |allergen|
      hash[allergen.ingredient] += 1
    end
    most_common_allergen = hash.max_by{|key, value| value}
    most_common_allergen[0]
  end

  def users
    allergen = Allergen.all.select {|allergen| allergen.ingredient == self}
    allergen.map{|card| card.user}
  end

end
