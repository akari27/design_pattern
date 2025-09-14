require_relative 'beverage'

# Milkクラスは具象デコレーター
class Milk < Beverage
  def initialize(beverage)
    @beverage = beverage
  end

  def description
    "#{@beverage.description}, ミルク追加"
  end

  def cost
    @beverage.cost + 100
  end
end
