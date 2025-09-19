class LightOnCommand
  def initialize(light)
    @light = light
  end

  def execute
    @light.on
  end

  def undo
    @light.off
  end
end
