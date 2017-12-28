class Ingredient

  @@all = []

  def save
    @@all << self
  end

  def self.most_common_allergen
    allergen_counter = {}
    Allergen.all.each do |allergen|
      if allergen_counter.keys.include?(allergen.ingredient)
        allergen_counter[allergen.ingredient] += 1
      else
        allergen_counter[allergen.ingredient] = 1
      end
    end
      most_common = allergen_counter.max_by { |k, v| v }
      most_common[0]
  end

  def self.all
    @@all
  end

  def self.create
    noob = Ingredient.new
    noob.save
    noob
  end





end
