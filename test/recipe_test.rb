require './lib/ingredient'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'

class RecipeTest < Minitest::Test

  def setup
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
  end

  def test_it_exists
    assert_instance_of Recipe, @mac_and_cheese
  end

  def test_it_initializes_with_name
    assert_equal "Mac and Cheese", @mac_and_cheese.name
  end

  def test_it_can_add_ingredients
    expected = {
      @cheese => 2,
      @mac => 8
    }
    assert_equal ({}), @mac_and_cheese.ingredients_required
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal expected, @mac_and_cheese.ingredients_required
  end

  def test_it_can_tell_us_amount_required
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal 2, @mac_and_cheese.amount_required(@cheese)
    assert_equal 8, @mac_and_cheese.amount_required(@mac)
  end

  def test_it_can_tell_us_ingredients
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal [@cheese, @mac], @mac_and_cheese.ingredients
  end

  def test_it_can_tell_us_ingredient_calories
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal 100, @mac_and_cheese.ingredient_calories(@cheese)
    assert_equal 30, @mac_and_cheese.ingredient_calories(@mac)
  end

  def test_it_can_tell_us_total_calories
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal 440, @mac_and_cheese.total_calories
  end
end
