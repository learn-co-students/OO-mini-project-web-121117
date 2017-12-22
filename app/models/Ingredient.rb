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


  #fixed it
  def self.most_common_allergen
    all_allergen_ingredients = Allergen.all.map do |allergen|
      allergen.ingredient
    end
    sorted = all_allergen_ingredients.sort_by do |ingredient|
      all_allergen_ingredients.count(ingredient)
    end
    sorted[-1]
  end

end
