class StereoOnCommand
  DEFAULT_VOLUME = 11

  def initialize(stereo)
    @stereo = stereo
  end

  def execute
    @stereo.on
    @stereo.set_cd
    @stereo.set_volume(DEFAULT_VOLUME)
  end

  def undo
    @stereo.off
  end
end
