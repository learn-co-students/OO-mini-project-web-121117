class Allergen

  @@all = []

  attr_reader :user, :ingredient

  def initialize(ingredient, user)
    @ingredient = ingredient
    @user = user
  end

  def save
    @@all << self
  end

  def self.create(ingredient, user)
    noob = Allergen.new(ingredient, user)
    noob.save
    noob
  end

  def self.all
    @@all
  end

end
