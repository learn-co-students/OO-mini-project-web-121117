class Allergen

   @@all = []
   attr_accessor :user, :ingredient

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  

end
