class Allergen
  attr_accessor :ingredient, :user

  @@all = []

  def initialize(ingredient, user)
    @ingredient = ingredient
    @user = user 
  end 

  def self.create(ingredient, user)
    new_allergen = Allergen.new(ingredient, user)
    new_allergen.save 
  end

  def save 
    @@all << self
    self 
  end

  def self.all
    @@all
  end
end