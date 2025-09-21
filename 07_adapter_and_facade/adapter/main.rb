require_relative 'animals/duck'
require_relative 'animals/turkey'
require_relative 'turkey_adapter'

def test_duck(duck)
  duck.quack
  duck.fly
end

duck = Duck.new
test_duck(duck)

# test_duckメソッドは、duckではなくturkeyを渡されても気づかない
turkey = Turkey.new
turkey_adapter = TurkeyAdapter.new(turkey)
test_duck(turkey_adapter)
