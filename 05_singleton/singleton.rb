class SomeSingleton
  @@unique_instance = new

  private_class_method :new

  def self.get_instance
    @@unique_instance
  end
end

some_singleton1 = SomeSingleton.get_instance
puts some_singleton1

some_singleton2 = SomeSingleton.get_instance
puts some_singleton2
