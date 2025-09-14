require_relative 'beverage'

# Coffeeクラスは具象コンポーネント
class Coffee < Beverage
  def description
    'コーヒー'
  end

  def cost
    600
  end
end
