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


  #this isn't working
  def self.most_common_allergen
    sorted = Allergen.all.sort_by do |allergen|
      Allergen.all.count(allergen.ingredient)
    end
    binding.pry
    sorted[-1].ingredient
  end

end
