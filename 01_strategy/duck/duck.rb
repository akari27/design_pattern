require 'forwardable'

class Duck
  extend Forwardable

  attr_accessor :fly_behavior, :quack_behavior

  def_delegator :@fly_behavior, :fly
  def_delegator :@quack_behavior, :quack
end
