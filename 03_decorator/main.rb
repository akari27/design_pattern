require_relative 'coffee'
require_relative 'milk'
require_relative 'whip'

coffee = Coffee.new
puts "#{coffee.description}の価格: #{coffee.cost}"

coffee_with_milk = Milk.new(coffee)
puts "#{coffee_with_milk.description}の価格: #{coffee_with_milk.cost}"

coffee_with_milk_and_whip = Whip.new(coffee_with_milk)
puts "#{coffee_with_milk_and_whip.description}の価格: #{coffee_with_milk_and_whip.cost}"
