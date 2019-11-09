require 'minitest/autorun'
require 'minitest/pride'
require './lib/Ingredient'
require './lib/Recipe'
require 'pry'


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
    assert_equal ({}), @mac_and_cheese.ingredients_required
  end

  def test_can_add_ingredient
    @mac_and_cheese.add_ingredient(@cheese, 2)

    expected = {
      @cheese => 2
    }

  assert_equal expected, @mac_and_cheese.ingredients_required
    @mac_and_cheese.add_ingredient(@mac, 8)

    expected = { @cheese => 2,@mac => 8}
  assert_equal expected, @mac_and_cheese.ingredients_required
  end

  def test_amount_required
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal 2, @mac_and_cheese.amount_required(@cheese)
    assert_equal 8, @mac_and_cheese.amount_required(@mac)
  end

  def test_recipe_ingredients
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal [@cheese, @mac], @mac_and_cheese.ingredients

  end

  def test_calories_in_recipe
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal 440, @mac_and_cheese.calories
  end
end
