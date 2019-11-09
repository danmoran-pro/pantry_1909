require 'minitest/autorun'
require 'minitest/pride'
require './lib/Ingredient'
require './lib/Recipe'
require './lib/Pantry'
require 'pry'

class PantryTest < Minitest::Test

  def setup
   @pantry = Pantry.new
   @cheese = Ingredient.new("Cheese", "C", 50)
   @mac = Ingredient.new("Macaroni", "oz", 200)
   @mac_and_cheese = Recipe.new("Mac and Cheese")


  end

  def test_pantry_excists
    assert_instance_of Pantry, @pantry
  end

  def test_pantry_can_restock
    assert_equal ({}), @pantry.stock
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    assert_equal ({}), @pantry.stock

    assert_equal 0, @pantry.stock_check(@cheese)

    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    assert_equal 15, @pantry.stock_check(@cheese)
  end

  def test_enough_ingredients_for?
    @mac_and_cheese.add_ingredient(@mac, 8)
    refute @pantry.enough_ingredients_for?(@mac_and_cheese)

    @pantry.restock(@mac, 7)
    refute @pantry.enough_ingredients_for?(@mac_and_cheese)

    @pantry.restock(@mac,1)
    assert @pantry.enough_ingredients_for?(@mac_and_cheese)
  end


end
