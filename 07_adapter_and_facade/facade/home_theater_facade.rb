class HomeTheaterFacade
  def initialize(amplifier, tuner, dvd_player, projector, theater_lights, screen, popcorn_popper)
    @amplifier = amplifier
    @tuner = tuner
    @dvd_player = dvd_player
    @projector = projector
    @theater_lights = theater_lights
    @screen = screen
    @popcorn_popper = popcorn_popper
  end

  def watch_movie(movie)
    puts '映画を観る準備をします'
    @popcorn_popper.on
    @popcorn_popper.pop
    @theater_lights.dim(10)
    @screen.down
    @projector.on
    @projector.wide_screen_mode
    @amplifier.on
    @amplifier.set_dvd(@dvd_player)
    @amplifier.set_surround_sound
    @amplifier.set_volume(5)
    @dvd_player.on
    @dvd_player.play(movie)
  end

  def end_movie
    puts 'ムービーシアターを停止します'
    @popcorn_popper.off
    @theater_lights.off
    @screen.up
    @projector.off
    @amplifier.off
    @dvd_player.stop
    @dvd_player.eject
    @dvd_player.off
  end
end
