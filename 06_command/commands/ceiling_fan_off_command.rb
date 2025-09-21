class CeilingFanOffCommand
  def initialize(ceiling_fan)
    @ceiling_fan = ceiling_fan
    @prev_speed = ceiling_fan.speed
  end

  def execute
    @prev_speed = @ceiling_fan.speed
    @ceiling_fan.off
  end

  def undo
    case @prev_speed
    when CeilingFan::HIGH
      @ceiling_fan.high
    when CeilingFan::LOW
      @ceiling_fan.low
    when CeilingFan::OFF
      @ceiling_fan.off
    end
  end
end
