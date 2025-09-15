require_relative 'duck/rubber_duck'
require_relative 'duck/fly_behaviors/fly_with_wings'

rubber_duck = RubberDuck.new

puts rubber_duck.display
puts rubber_duck.fly
puts rubber_duck.quack

rubber_duck.fly_behavior = FlyWithWings.new
puts rubber_duck.fly
