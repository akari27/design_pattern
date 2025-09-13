require_relative 'duck'
require_relative 'fly_behaviors/fly_rocket_powered'
require_relative 'quack_behaviors/mute_quack'

class RubberDuck < Duck
  def initialize
    @fly_behavior   = FlyRocketPowered.new
    @quack_behavior = MuteQuack.new
  end

  def display
    "( '8' )"
  end
end
