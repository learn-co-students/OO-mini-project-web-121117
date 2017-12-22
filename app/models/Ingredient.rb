class Ingredient
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def self.create(name)
    new_ingredient = Ingredient.new(name)
    new_ingredient.save
  end

  def save
    @@all << self
    self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    allergen_count = Hash.new(0)

    Allergen.all.each do |allergen|
      allergen_count[allergen] += 1
    end 
    allergen_count.key(allergen_count.values.max)
  end
end
