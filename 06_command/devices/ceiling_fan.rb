class CeilingFan
  HIGH = 2
  LOW = 1
  OFF = 0

  attr_reader :speed

  def initialize
    @speed = OFF
  end

  def high
    @speed = HIGH
    puts 'ファンの強さが強になりました'
  end

  def low
    @speed = LOW
    puts 'ファンの強さが弱になりました'
  end

  def off
    @speed = OFF
    puts 'ファンが止まりました'
  end
end
