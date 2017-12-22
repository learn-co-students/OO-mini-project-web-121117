class RecipeCard
  attr_accessor :user, :recipe, :rating
  attr_reader :date

  @@all = []

  def initialize(date, rating, user, recipe)
    @date = date
    @rating = rating
    @user = user
    @recipe = recipe
    @@all << self
  end

  def self.all
    @@all
  end

end
