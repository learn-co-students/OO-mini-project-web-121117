class RecipeIngredient

   @@all = []

    attr_accessor :recipe, :ingredient

   def initialize
     @@all << self
   end

   def self.all
     @@all
   end



end
