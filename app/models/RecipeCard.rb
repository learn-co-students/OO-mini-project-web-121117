class RecipeCard

  attr_accessor :rating, :user, :recipe
  attr_reader :date

  @@all = []

  def initialize(recipe, date, rating, user)
    @date = date
    @user = user
    @recipe = recipe
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end

end
