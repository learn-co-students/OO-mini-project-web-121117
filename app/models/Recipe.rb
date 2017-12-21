



class Recipe

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def ingredients
    h = RecipeIngredient.all.select do |rio|
      rio.recipe == self
    end
    h = h.map { |recipe| recipe.ingredient }
    h.uniq
  end

  def add_ingredients(ingredients_instance_array)
    ingredients_instance_array.each do |ingredient_instance|
      RecipeIngredient.create(ingredient_instance, self)
    end
  end

  def users
    h = []
    RecipeCard.all.each do |x|
      if x.recipe == self
        h << x.user
      end
    end
    h
  end

  def allergens
    h = []
    Allergen.all.each do |allergen_instance|
      if self.ingredients.include?(allergen_instance.ingredient)
        h << allergen_instance.ingredient
      end
    end
    h
  end

  def save
    @@all << self
  end


  def self.all
    @@all
  end

  def self.most_popular
    h = RecipeCard.all.map do |recipecard_instance|
      recipecard_instance.recipe
    end
    freq = h.inject(Hash.new(0)) { |hash,v| hash[v] += 1; hash }
    h = h.max_by do |v|
      freq[v]
    end
  end
end
