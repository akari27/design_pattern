class MacroCommand
  def initialize(commands)
    @commands = commands
  end

  def execute
    @commands.each(&:execute)
  end
end
