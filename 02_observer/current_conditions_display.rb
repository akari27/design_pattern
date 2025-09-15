# このクラスはオブザーバ
class CurrentConditionsDisplay
  attr_accessor :temperature, :humidity, :weather_data

  def initialize(weather_data)
    @weather_data = weather_data
    weather_data.register_observer(self)
  end

  def update(temperature, humidity, pressure)
    @temperature = temperature
    @humidity = humidity
    @pressure = pressure

    display
  end

  def display
    puts "現在の気象状況: 気温#{@temperature}度 湿度#{@humidity}% 気圧#{@pressure}Pa"
  end
end
