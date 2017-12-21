class Allergen
  attr_accessor :ingredient, :user

  @@all = []

  def initialize(ingredient_instance, user_instance)
    @ingredient = ingredient_instance
    @user = user_instance
  end

  def self.create(ingredient_instance, user_instance)
    new_allergen = Allergen.new(ingredient_instance, user_instance)
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
