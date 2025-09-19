class RemoteControl
  def initialize
    @on_commands = Array.new(7)
    @off_commands = Array.new(7)
    @undo_command = nil
  end

  def set_command(slot, on_command, off_command)
    @on_commands[slot] = on_command
    @off_commands[slot] = off_command
  end

  def button_on_was_pressed(slot)
    @on_commands[slot].execute
    @undo_command = @on_commands[slot]
  end

  def button_off_was_pressed(slot)
    @off_commands[slot].execute
    @undo_command = @off_commands[slot]
  end

  def undo_button_was_pressed
    return if @undo_command.nil?

    @undo_command.undo
  end

  def commands
    str = "\n------ リモコン-------\n"

    @on_commands.each_with_index do |command, i|
      str += "[slot #{i}] #{command.class}    #{@off_commands[i].class}\n"
    end

    str += "[undo] #{@undo_command.class}\n"

    str
  end
end
