require_relative 'sub_systems/amplifier'
require_relative 'sub_systems/tuner'
require_relative 'sub_systems/dvd_player'
require_relative 'sub_systems/projector'
require_relative 'sub_systems/theater_lights'
require_relative 'sub_systems/screen'
require_relative 'sub_systems/popcorn_popper'
require_relative 'home_theater_facade'

home_theater = HomeTheaterFacade.new(
  Amplifier.new,
  Tuner.new,
  DvdPlayer.new,
  Projector.new,
  TheaterLights.new,
  Screen.new,
  PopcornPopper.new
)

home_theater.watch_movie('なんかのえいが')
home_theater.end_movie
