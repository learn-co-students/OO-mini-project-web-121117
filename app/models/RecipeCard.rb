class RecipeCard
  attr_accessor :date, :rating, :recipe, :user, :recipe_card

  @@all = []

  def initialize(recipe, rating)
    @date = Time.now 
    @rating = rating
    @recipe = recipe
  end

  def self.create(recipe, rating)
    new_recipe_card = RecipeCard.new(recipe, rating)
    new_recipe_card.save 
    new_recipe_card
  end 

  def save 
    @@all << self 
  end

  def self.all
    @@all
  end
end