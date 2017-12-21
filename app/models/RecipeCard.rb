class RecipeCard
  attr_accessor :date, :rating, :user, :recipe

  @@all = []

  def initialize(recipe_instance, user_instance, date, rating)
    @recipe = recipe_instance
    @user = user_instance
    @date = date
    @rating = rating
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

end
