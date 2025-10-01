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

class NoQuarterState
  def initialize(gumball_machine)
    @gumball_machine = gumball_machine
  end

  def insert_quarter
    puts 'コインを入れました'
    @gumball_machine.state = @gumball_machine.has_quarters_state
  end

  def eject_quarter
    puts 'コインが入っていません'
  end

  def turn_crank
    puts 'コインを入れてください'
  end

  def dispense
    puts 'コインを入れてください'
  end
end

class HasQuarterState
  def initialize(gumball_machine)
    @gumball_machine = gumball_machine
  end

  def insert_quarter
    puts 'コインは1枚までです'
  end

  def eject_quarter
    puts 'コインを返却します'
    @gumball_machine.state = @gumball_machine.no_quarter_state
  end

  def turn_crank
    puts 'ハンドルを回しました...'
    @gumball_machine.state = @gumball_machine.sold_state
    @gumball_machine.state.dispense
  end

  def dispense
    puts 'ハンドルを回してください'
  end
end

class SoldState
  def initialize(gumball_machine)
    @gumball_machine = gumball_machine
  end

  def insert_quarter
    puts 'しばらくお待ちください。商品をお取りください'
  end

  def eject_quarter
    puts '商品をお取りください'
  end

  def turn_crank
    puts 'ハンドルは1回しか回せません'
  end

  def dispense
    puts 'ガムボールが出てきます...'
    @gumball_machine.count -= 1
    if @gumball_machine.count.zero?
      puts 'ガムボールがなくなりました'
      @gumball_machine.state = @gumball_machine.sold_out_state
    else
      @gumball_machine.state = @gumball_machine.no_quarter_state
    end
  end
end

class SoldOutState
  def initialize(gumball_machine)
    @gumball_machine = gumball_machine
  end

  def insert_quarter
    puts '売り切れです。コインを返却します'
  end

  def eject_quarter
    puts '売り切れです。コインを返却できません'
  end

  def turn_crank
    puts '売り切れです'
  end

  def dispense
    puts '売り切れです'
  end
end

class GumballMachineWithState
  attr_accessor :state, :count
  attr_reader :sold_out_state, :no_quarter_state, :has_quarters_state, :sold_state

  def initialize(number_gumballs)
    @sold_out_state = SoldOutState.new(self)
    @no_quarter_state = NoQuarterState.new(self)
    @has_quarters_state = HasQuarterState.new(self)
    @sold_state = SoldState.new(self)

    @count = number_gumballs
    @state = if number_gumballs > 0
               @no_quarter_state
             else
               @sold_out_state
             end
  end

  def insert_quarter
    @state.insert_quarter
  end

  def eject_quarter
    @state.eject_quarter
  end

  def turn_crank
    @state.turn_crank
  end

  def dispense
    @state.dispense
  end
end

gumball_machine_with_state = GumballMachineWithState.new(5)
puts '---------------------'
gumball_machine_with_state.insert_quarter
gumball_machine_with_state.turn_crank
puts '---------------------'
gumball_machine_with_state.insert_quarter
gumball_machine_with_state.eject_quarter
gumball_machine_with_state.turn_crank
puts '---------------------'
gumball_machine_with_state.insert_quarter
gumball_machine_with_state.insert_quarter
gumball_machine_with_state.turn_crank
puts '---------------------'
gumball_machine_with_state.insert_quarter
gumball_machine_with_state.turn_crank
puts '---------------------'
gumball_machine_with_state.insert_quarter
gumball_machine_with_state.turn_crank
puts '---------------------'
gumball_machine_with_state.insert_quarter
gumball_machine_with_state.turn_crank
puts '---------------------'

class WinnerState
  def initialize(gumball_machine)
    @gumball_machine = gumball_machine
  end

  def insert_quarter
    puts 'しばらくお待ちください。商品をお取りください'
  end

  def eject_quarter
    puts '商品をお取りください'
  end

  def turn_crank
    puts 'ハンドルは1回しか回せません'
  end

  def dispense
    puts '当たりです！ガムボールが2個出てきます'
    @gumball_machine.count -= 1
    if @gumball_machine.count.zero?
      puts 'ガムボールがなくなりました'
      @gumball_machine.state = @gumball_machine.sold_out_state
    else
      @gumball_machine.count -= 1
      if @gumball_machine.count.zero?
        puts 'ガムボールがなくなりました'
        @gumball_machine.state = @gumball_machine.sold_out_state
      else
        @gumball_machine.state = @gumball_machine.no_quarter_state
      end
    end
  end
end

class GumballMachineWithWinnerState < GumballMachineWithState
  def turn_crank
    if rand(10).zero? && @state == @has_quarters_state && @count > 1
      @state = @winner_state
    else
      super
    end
    @state.dispense
  end

  def initialize(number_gumballs)
    super
    @winner_state = WinnerState.new(self)
  end

  attr_reader :winner_state
end

gumball_machine_with_winner_state = GumballMachineWithWinnerState.new(5)
puts '---------------------'
gumball_machine_with_winner_state.insert_quarter
gumball_machine_with_winner_state.turn_crank
puts '---------------------'
gumball_machine_with_winner_state.insert_quarter
gumball_machine_with_winner_state.eject_quarter
gumball_machine_with_winner_state.turn_crank
puts '---------------------'
gumball_machine_with_winner_state.insert_quarter
gumball_machine_with_winner_state.insert_quarter
gumball_machine_with_winner_state.turn_crank
puts '---------------------'
