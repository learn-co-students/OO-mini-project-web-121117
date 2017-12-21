class Ingredient
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.most_common_allergen
    h = Allergen.all.map do |allergen_instance|
      allergen_instance.ingredient
    end
    freq = h.inject(Hash.new(0)) { |hash,v| hash[v] += 1; hash }
    h = h.max_by do |v|
      freq[v]
    end
  end

end
