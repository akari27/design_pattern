class TurkeyAdapter
  def initialize(turkey)
    @turkey = turkey
  end

  def quack
    @turkey.gobble
  end

  def fly
    5.times { @turkey.fly }
  end
end
