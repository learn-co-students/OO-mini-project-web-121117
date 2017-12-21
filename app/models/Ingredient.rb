class Ingredient
  attr_accessor :name
  @@all= []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    allergen_count = Hash.new(0)
    Allergen.all.each do |allergen|
      allergen_count[allergen.ingredient] += 1
    end
    allergen_count.each {|allergen, count| return allergen if count == allergen_count.values.max }
  end





end
