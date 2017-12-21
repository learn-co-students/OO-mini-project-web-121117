class RecipeCard

  @@all = []
  attr_accessor :date, :rating, :user, :recipe

def initialize
  @@all << self

end


def self.all
  @@all
end


end
