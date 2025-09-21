require_relative 'remote_control'
require_relative 'devices/light'
require_relative 'commands/light_on_command'
require_relative 'commands/light_off_command'
require_relative 'devices/stereo'
require_relative 'commands/stereo_on_command'
require_relative 'commands/stereo_off_command'
require_relative 'devices/ceiling_fan'
require_relative 'commands/ceiling_fan_high_command'
require_relative 'commands/ceiling_fan_low_command'
require_relative 'commands/ceiling_fan_off_command'
require_relative 'commands/macro_command'

# [P.203~] 照明のオンオフ
remote_control = RemoteControl.new

remote_control.set_command(0, LightOnCommand.new(Light.new), LightOffCommand.new(Light.new))
puts remote_control.commands

remote_control.button_on_was_pressed(0)
remote_control.undo_button_was_pressed

remote_control.button_off_was_pressed(0)
remote_control.undo_button_was_pressed

# [P.211~] ステレオのオンオフ
remote_control.set_command(1, StereoOnCommand.new(Stereo.new), StereoOffCommand.new(Stereo.new))
puts remote_control.commands

remote_control.button_on_was_pressed(1)
remote_control.undo_button_was_pressed

remote_control.button_off_was_pressed(1)
remote_control.undo_button_was_pressed

# [P.221~] シーリングファンの強度変更
ceiling_fan = CeilingFan.new
remote_control.set_command(2, CeilingFanHighCommand.new(ceiling_fan), CeilingFanOffCommand.new(ceiling_fan))
remote_control.set_command(3, CeilingFanLowCommand.new(ceiling_fan), CeilingFanOffCommand.new(ceiling_fan))
puts remote_control.commands

remote_control.button_on_was_pressed(2)
remote_control.undo_button_was_pressed

remote_control.button_on_was_pressed(2)
remote_control.button_on_was_pressed(3)
remote_control.undo_button_was_pressed

# [P.225~] マクロコマンド
party_on = [LightOnCommand.new(Light.new), StereoOnCommand.new(Stereo.new), CeilingFanHighCommand.new(ceiling_fan)]
party_off = [LightOffCommand.new(Light.new), StereoOffCommand.new(Stereo.new), CeilingFanOffCommand.new(ceiling_fan)]
remote_control.set_command(4, MacroCommand.new(party_on), MacroCommand.new(party_off))
puts remote_control.commands
remote_control.button_on_was_pressed(4)
remote_control.button_off_was_pressed(4)
