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




  #   allergen_highest = 0
  #   most_common_allergen_name = nil
  #   Allergen.all.each do |allergen| 
  #     allergen_count = 0 
  #       if user.allergen == allergen 
  #         allergen_count += 1 
  #       end 
  #       if allergen_count > allergen_highest
  #         allergen_highest = allergen_count 
  #         most_commone_allergen_name = allergen
  #       end  
  #     end 
  #   end
  #   most_common_allergen_name
  # end
end
