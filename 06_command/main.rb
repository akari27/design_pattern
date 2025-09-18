require_relative 'remote_control'
require_relative 'devices/light'
require_relative 'commands/light_on_command'
require_relative 'commands/light_off_command'
require_relative 'devices/stereo'
require_relative 'commands/stereo_on_command'
require_relative 'commands/stereo_off_command'

remote_control = RemoteControl.new

remote_control.set_command(0, LightOnCommand.new(Light.new), LightOffCommand.new(Light.new))
puts remote_control.commands

remote_control.button_on_was_pressed(0)
remote_control.button_off_was_pressed(0)

remote_control.set_command(1, StereoOnCommand.new(Stereo.new), StereoOffCommand.new(Stereo.new))
puts remote_control.commands
remote_control.button_on_was_pressed(1)
remote_control.button_off_was_pressed(1)
