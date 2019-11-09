require 'minitest/autorun'
require 'minitest/pride'
require './lib/Ingredient'
require './lib/Recipe'


class RecipeTest < Minitest::Test

  def setup
    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
  end

  def test_recipe_exists
    assert_instance_of Recipe, @mac_and_cheese
  end

  def test_recipe_has_name
    assert_equal "Mac and Cheese", @mac_and_cheese.name
  end

  def test_ingredient_require_starts_empty
    expected = {}
    assert_equal expected, @mac_and_cheese.ingredients_required
  end
# pry(main)> mac_and_cheese.add_ingredient(cheese, 2)
#
# pry(main)> mac_and_cheese.add_ingredient(mac, 8)
#
# pry(main)> mac_and_cheese.ingredients_required
# # => {#<Ingredient:0x00007fd7811553c8...> => 2, #<Ingredient:0x00007fd78110b0e8...> => 8}
#
# pry(main)> mac_and_cheese.amount_required(cheese)
# # => 2
#
# pry(main)> mac_and_cheese.amount_required(mac)
# # => 8
#
# pry(main)> mac_and_cheese.ingredients
# # => [#<Ingredient:0x007fe8438c7a70...>, #<Ingredient:0x007fe843857f40...>]
#
# pry(main)> mac_and_cheese.total_calories
# # => 440

end
