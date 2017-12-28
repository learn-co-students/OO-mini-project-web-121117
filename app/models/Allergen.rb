class Allergen
  attr_reader :ingredient, :user
  @@all = []

  def initialize(ingredient, user)
    @ingredient = ingredient
    @user = user
    @@all << self
  end

  def self.all
    @@all
  end

end
