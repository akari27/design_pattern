require_relative 'weather_data'
require_relative 'current_conditions_display'

weather_data = WeatherData.new
CurrentConditionsDisplay.new(weather_data)
weather_data.set_mesurements(27, 65, 30.4)
weather_data.set_mesurements(82, 70, 29.2)
