class LightOnCommand
  def initialize(light)
    @light = light
  end

  def execute
    @light.on
  end
end
