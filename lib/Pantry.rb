class Pantry

  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end

  def enough_ingredients_for?(recipe)
  recipe.ingredients.all? {|ingredient, amount| stock_check(ingredient) >= recipe.amount_required(ingredient)}
end

end
