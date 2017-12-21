class RecipeCard
  attr_accessor :date, :rating, :user, :recipe
  @@all = []

  def initialize(recipe, rating, user)
    @recipe = recipe
    @date = Time.now
    @rating = rating
    @user = user
    @@all << self
  end

  def self.all
    @@all
  end

end
