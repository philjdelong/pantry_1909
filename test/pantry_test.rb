require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test

  def setup
    @pantry = Pantry.new
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @cheese = Ingredient.new("Cheese", "C", 50)
    @mac = Ingredient.new("Macaroni", "oz", 200)
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_it_can_check_stock
    assert_equal ({}), @pantry.stock
    assert_equal 0, @pantry.stock_check(@cheese)
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    assert_equal 15, @pantry.stock_check(@cheese)
  end

  def test_it_can_check_if_enough_ingredients
    require "pry"; binding.pry
    assert_equal false, @pantry.enough_ingredients_for?(@mac_and_cheese)
    @pantry.restock(@mac, 7)
    assert_equal false, @pantry.enough_ingredients_for?(@mac_and_cheese)
    @pantry.restock(@mac, 1)
    assert_equal true, @pantry.enough_ingredients_for?(@mac_and_cheese)
  end

end
