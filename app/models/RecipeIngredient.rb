class RecipeIngredient

  @@all = []

  attr_reader :recipe, :ingredient

  def initialize(recipe, ingredient)
    @recipe = recipe
    @ingredient = ingredient
  end

  def save
    @@all << self
  end

  def self.create(recipe,ingredient)
    noob = RecipeIngredient.new(recipe, ingredient)
    noob.save
    noob
  end

  def self.all
    @@all
  end





end
