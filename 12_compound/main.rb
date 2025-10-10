class MallardDuck
  def quack
    puts 'がーがー'
  end
end

class RubberDuck
  def quack
    puts 'きゅーきゅー'
  end
end

class Goose
  def honk
    puts 'がー'
  end
end

class GooseAdapter
  def initialize(goose)
    @goose = goose
  end

  def quack
    @goose.honk
  end
end

class DuckSimulator
  def initialize
    @mallard_duck = MallardDuck.new
    @rubber_duck = RubberDuck.new
    @goose_adapter = GooseAdapter.new(Goose.new)
  end

  def simulate
    puts 'シミュレーション開始'
    @mallard_duck.quack
    @rubber_duck.quack
    @goose_adapter.quack
  end
end

simulator_with_goose = DuckSimulator.new
simulator_with_goose.simulate
