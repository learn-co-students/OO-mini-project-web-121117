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

  def self.most_common_allergen
    top_allergen_hash = Hash.new(0)
    Allergen.all.each do |allergen|
      top_allergen_hash[allergen.ingredient] += 1
    end
    top_allergen_hash.max_by {|ingredient, count| count}
  end
end
