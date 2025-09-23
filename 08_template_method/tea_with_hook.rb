require_relative 'caffeine_beverage_with_hook'

class TeaWithHook < CaffeineBeverageWithHook
  def brew
    puts '紅茶を淹れています'
  end

  def add_condiments
    puts 'レモンを追加しています'
  end

  def customer_wants_condiments?
    answer = get_user_input
    answer.downcase.start_with?('y')
  end

  def get_user_input
    puts 'レモンを追加しますか？ (y/n): '
    gets.chomp
  end
end
