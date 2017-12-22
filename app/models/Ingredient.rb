class Ingredient

  @@all = []

def initialize
  @@all << self
end

def self.all
  @@all
end

def self.most_common_allergen # WTF
   allergen_counter = {}
   Allergen.all.each do |allerg|
     if allergen_counter.keys.include?(allerg.ingredient)
       allergen_counter[allerg.ingredient] += 1
     else
       allergen_counter[allerg.ingredient] = 1
     end
   end
    highest_value = allergen_counter.max_by {|k, v| v}
    highest_value[0]
 end

end
