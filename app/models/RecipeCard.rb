class RecipeCard

  @@all = []

  attr_accessor :rating
  attr_reader :user, :recipe, :date

  def initialize(user, recipe, date, rating)
    @user = user
    @recipe = recipe
    @date = date
    @rating = rating
  end


  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create(user, recipe, rating=0)
    noob = RecipeCard.new(user, recipe, Time.now, rating)
    noob.save
    noob
  end


end
