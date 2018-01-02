class RecipeCard
  attr_accessor :date, :rating, :user, :recipe
  @@all = []

  def initialize(user, recipe, date, rating)
    @user = user
    @recipe = recipe
    @date = date
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end

end
