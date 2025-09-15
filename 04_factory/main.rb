require_relative 'stores/new_york_pizza_store'
require_relative 'stores/chicago_pizza_store'

new_york_store = NewYorkPizzaStore.new
pizza = new_york_store.order_pizza('チーズ')
puts "#{pizza.class}が完成しました"
puts '--------------------------------'

chicago_store = ChicagoPizzaStore.new
pizza = chicago_store.order_pizza('チーズ')
puts "#{pizza.class}が完成しました"
