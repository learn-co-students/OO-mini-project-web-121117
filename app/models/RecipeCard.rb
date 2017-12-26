class RecipeCard
  attr_accessor :recipe, :rating

  attr_reader :user, :date
  @@all = []

  def initialize(recipe, user, date=nil, rating)
    @recipe = recipe
    @user = user
    @date ||= Time.now
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end
end
