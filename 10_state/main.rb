class GumballMachine
  SOLD_OUT = 0
  NO_QUARTERS = 1
  HAS_QUARTERS = 2
  SOLD = 3

  attr_accessor :state, :count

  def initialize(number_gumballs)
    @count = number_gumballs
    @state = if number_gumballs > 0
               NO_QUARTERS
             else
               SOLD_OUT
             end
  end

  def insert_quarter
    if @state == HAS_QUARTERS
      puts 'コインは1枚までです'
    elsif @state == NO_QUARTERS
      @state = HAS_QUARTERS
      puts 'コインを入れました'
    elsif @state == SOLD_OUT
      puts '売り切れです。コインを返却します'
    elsif @state == SOLD
      puts 'しばらくお待ちください。商品をお取りください'
    end
  end

  def eject_quarter
    if @state == HAS_QUARTERS
      puts 'コインを返却します'
      @state = NO_QUARTERS
    elsif @state == NO_QUARTERS
      puts 'コインが入っていません'
    elsif @state == SOLD_OUT
      puts '売り切れです。コインを返却できません'
    elsif @state == SOLD
      puts '商品をお取りください'
    end
  end

  def turn_crank
    if @state == SOLD
      puts 'ハンドルは1回しか回せません'
    elsif @state == NO_QUARTERS
      puts 'コインを入れてください'
    elsif @state == SOLD_OUT
      puts '売り切れです'
    elsif @state == HAS_QUARTERS
      puts 'ハンドルを回しました...'
      @state = SOLD
      dispense
    end
  end

  def dispense
    if @state == SOLD
      puts 'ガムボールが出てきます...'
      @count -= 1
      if @count.zero?
        puts 'ガムボールがなくなりました'
        @state = SOLD_OUT
      else
        @state = NO_QUARTERS
      end
    elsif @state == NO_QUARTERS
      puts 'コインを入れてください'
    elsif @state == SOLD_OUT
      puts '売り切れです'
    elsif @state == HAS_QUARTERS
      puts 'ハンドルを回してください'
    end
  end
end

gumball_machine = GumballMachine.new(5)
puts gumball_machine.inspect
puts '---------------------'
gumball_machine.insert_quarter
gumball_machine.turn_crank
puts gumball_machine.inspect
puts '---------------------'
gumball_machine.insert_quarter
gumball_machine.eject_quarter
gumball_machine.turn_crank
puts gumball_machine.inspect
puts '---------------------'
gumball_machine.insert_quarter
gumball_machine.insert_quarter
gumball_machine.turn_crank
puts gumball_machine.inspect
puts '---------------------'
gumball_machine.insert_quarter
gumball_machine.turn_crank
puts gumball_machine.inspect
puts '---------------------'
gumball_machine.insert_quarter
gumball_machine.turn_crank
puts gumball_machine.inspect
puts '---------------------'
gumball_machine.insert_quarter
gumball_machine.turn_crank
puts gumball_machine.inspect
puts '---------------------'
