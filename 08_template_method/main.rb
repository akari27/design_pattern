require_relative 'coffee_with_hook'
require_relative 'tea_with_hook'

coffee_with_hook = CoffeeWithHook.new
coffee_with_hook.prepare

puts '---'

tea_with_hook = TeaWithHook.new
tea_with_hook.prepare
