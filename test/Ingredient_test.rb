require 'minitest/autorun'
require 'minitest/pride'
require './lib/Ingredient'


class IngredientTest < Minitest::Test

  def setup
    @cheese = Ingredient.new("Cheese", "oz", 50)
  end

  def test_ingredient_exists
    assert_instance_of Ingredient, @cheese
  end

  def test_name_exists
    assert_equal "Cheese", @cheese.name
  end

  def test_unit_exists
    assert_equal "oz", @cheese.unit
  end


  def test_case_name
   assert_equal 50, @cheese.calories
  end
end
