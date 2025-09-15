require_relative 'pizza'

class CheesePizza < Pizza
  def initialize(ingredient_factory)
    @ingredient_factory = ingredient_factory
  end

  def prepare
    @ingredient_factory.create_dough
    @ingredient_factory.create_sauce
    @ingredient_factory.create_cheese

    puts 'チーズピザを準備中'
  end
end
