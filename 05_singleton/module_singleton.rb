require 'singleton'

class SomeSingleton
  include Singleton
end

some_singleton = SomeSingleton.instance
puts some_singleton

some_singleton2 = SomeSingleton.instance
puts some_singleton2
