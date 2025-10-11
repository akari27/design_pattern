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

# Adapterパターンでガチョウをカモのように扱う
class GooseAdapter
  def initialize(goose)
    @goose = goose
  end

  def quack
    @goose.honk
  end
end

class QuackCounter
  attr_reader :number_of_quacks

  def initialize(duck)
    @duck = duck
    @number_of_quacks = 0
  end

  def quack
    @duck.quack
    @number_of_quacks += 1
  end
end

class DuckSimulator
  def initialize
    @mallard_duck = QuackCounter.new(MallardDuck.new)
    @rubber_duck = QuackCounter.new(RubberDuck.new)
    @goose_adapter = QuackCounter.new(GooseAdapter.new(Goose.new))
  end

  def simulate
    puts 'シミュレーション開始'
    @mallard_duck.quack
    @rubber_duck.quack
    @goose_adapter.quack
    puts "鳴いた回数: #{quack_counts}"
  end

  private

  def quack_counts
    @mallard_duck.number_of_quacks + @rubber_duck.number_of_quacks + @goose_adapter.number_of_quacks
  end
end

simulator_with_goose = DuckSimulator.new
simulator_with_goose.simulate

# Factoryパターンでカモの生成をカプセル化する
class CountingDuckFactory
  def create_mallard_duck
    QuackCounter.new(MallardDuck.new)
  end

  def create_rubber_duck
    QuackCounter.new(RubberDuck.new)
  end

  def create_goose_adapter
    QuackCounter.new(GooseAdapter.new(Goose.new))
  end
end

class DuckSimulatorWithFactory
  def initialize(factory)
    @mallard_duck = factory.create_mallard_duck
    @rubber_duck = factory.create_rubber_duck
    @goose_adapter = factory.create_goose_adapter
  end

  def simulate
    puts 'シミュレーション開始'
    @mallard_duck.quack
    @rubber_duck.quack
    @goose_adapter.quack
    puts "鳴いた回数: #{quack_counts}"
  end

  private

  def quack_counts
    @mallard_duck.number_of_quacks + @rubber_duck.number_of_quacks + @goose_adapter.number_of_quacks
  end
end

simulator_with_factory = DuckSimulatorWithFactory.new(CountingDuckFactory.new)
simulator_with_factory.simulate

# Compositeパターンでカモの群れを扱う
class Flock
  def initialize
    @ducks = []
  end

  def add(duck)
    @ducks << duck
  end

  def quack
    @ducks.each(&:quack)
  end
end

class DuckSimulatorWithFlock
  def initialize(factory)
    @flock_of_ducks = Flock.new

    mallard_duck1 = factory.create_mallard_duck
    mallard_duck2 = factory.create_mallard_duck
    rubber_duck = factory.create_rubber_duck
    goose_adapter = factory.create_goose_adapter

    @flock_of_ducks.add(mallard_duck1)
    @flock_of_ducks.add(mallard_duck2)
    @flock_of_ducks.add(rubber_duck)
    @flock_of_ducks.add(goose_adapter)
  end

  def simulate
    puts 'シミュレーション開始'
    @flock_of_ducks.quack
    puts "鳴いた回数: #{quack_counts}"
  end

  private

  def quack_counts
    @flock_of_ducks.instance_variable_get(:@ducks).sum(&:number_of_quacks)
  end
end

simulator_with_flock = DuckSimulatorWithFlock.new(CountingDuckFactory.new)
simulator_with_flock.simulate

# Observerパターンでカモの鳴き声を監視する
class Observable
  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def notify_observers(duck)
    @observers.each { |observer| observer.update(duck) }
  end
end

class Quackologist
  def update(duck)
    puts "Quackologist: #{duck.class} が鳴きました。"
  end
end

class ObservableDuck
  def initialize(duck)
    @duck = duck
    @observable = Observable.new
  end

  def quack
    @duck.quack
    @observable.notify_observers(self)
  end

  def add_observer(observer)
    @observable.add_observer(observer)
  end
end

class QuackCounterWithObservable
  attr_reader :number_of_quacks

  def initialize(duck)
    @duck = ObservableDuck.new(duck)
    @number_of_quacks = 0
    @duck.add_observer(Quackologist.new)
  end

  def quack
    @duck.quack
    @number_of_quacks += 1
  end
end

class CountingDuckFactoryWithObservable
  def create_mallard_duck
    QuackCounterWithObservable.new(MallardDuck.new)
  end

  def create_rubber_duck
    QuackCounterWithObservable.new(RubberDuck.new)
  end

  def create_goose_adapter
    QuackCounterWithObservable.new(GooseAdapter.new(Goose.new))
  end
end

simulator_with_observable = DuckSimulatorWithFlock.new(CountingDuckFactoryWithObservable.new)
simulator_with_observable.simulate
