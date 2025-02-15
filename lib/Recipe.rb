class Recipe

  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
  end

  def ingredients
    @ingredients_required.keys
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] += amount
  end

  def amount_required(ingredient)
    @ingredients_required[ingredient]
  end

  def calories
    @ingredients_required.sum {|ingredient, amount| ingredient.calories * amount}
  end
end
