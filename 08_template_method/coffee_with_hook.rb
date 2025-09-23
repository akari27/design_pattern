require_relative 'caffeine_beverage_with_hook'

class CoffeeWithHook < CaffeineBeverageWithHook
  def brew
    puts 'コーヒーを淹れています'
  end

  def add_condiments
    puts 'ミルクと砂糖を追加しています'
  end

  def customer_wants_condiments?
    answer = get_user_input
    answer.downcase.start_with?('y')
  end

  def get_user_input
    puts 'ミルクと砂糖を追加しますか？ (y/n): '
    gets.chomp
  end
end
