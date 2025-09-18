class StereoOffCommand
  def initialize(stereo)
    @stereo = stereo
  end

  def execute
    @stereo.off
  end
end
