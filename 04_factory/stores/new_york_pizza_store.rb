require_relative 'pizza_store'
require_relative '../factories/new_york_pizza_ingredient_factory'
require_relative '../pizzas/cheese_pizza'
require_relative '../pizzas/pepperoni_pizza'
require_relative '../pizzas/clam_pizza'

class NewYorkPizzaStore < PizzaStore
  def initialize
    @ingredient_factory = NewYorkPizzaIngredientFactory.new
  end

  def create_pizza(type)
    case type
    when 'チーズ'
      CheesePizza.new(@ingredient_factory)
    when 'ペパロニ'
      PepperoniPizza.new(@ingredient_factory)
    when 'アサリ'
      ClamPizza.new(@ingredient_factory)
    end
  end
end
