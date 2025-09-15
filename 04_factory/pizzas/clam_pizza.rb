require_relative 'pizza'

class ClamPizza < Pizza
  def initialize(ingredient_factory)
    @ingredient_factory = ingredient_factory
  end

  def prepare
    @ingredient_factory.create_dough
    @ingredient_factory.create_sauce
    @ingredient_factory.create_cheese
    @ingredient_factory.create_clam

    puts 'アサリピザを準備中'
  end
end
