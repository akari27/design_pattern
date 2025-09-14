require_relative 'beverage'

# Milkクラスは具象デコレーター
class Whip < Beverage
  def initialize(beverage)
    @beverage = beverage
  end

  def description
    "#{@beverage.description}, ホイップ追加"
  end

  def cost
    @beverage.cost + 80
  end
end
