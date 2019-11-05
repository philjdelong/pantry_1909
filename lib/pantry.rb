class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def restock(ingredient, qty)
    if @stock[ingredient] == nil
      @stock[ingredient] = qty
    else
      @stock[ingredient] = @stock[ingredient] + qty
    end
  end

  def stock_check(ingredient)
    if @stock[ingredient] == nil
      return 0
    else
      @stock[ingredient]
    end
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.each do |ingredient|
      if stock_check(ingredient) < recipe.amount_required(ingredient)
        return false
      end
    end
  end
end
