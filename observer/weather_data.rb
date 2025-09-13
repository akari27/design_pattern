# このクラスはサブジェクト
class WeatherData
  attr_accessor :observers, :temperature, :humidity, :pressure

  def initialize
    @observers = []
  end

  def register_observer(observer)
    @observers.push(observer)
  end

  def remove_observer(observer)
    @observers.delete(observer)
  end

  # 全てのオブザーバに対し、サブジェクトの状態変化を通知するメソッド
  def notify_observers
    @observers.each do |observer|
      observer.update(@temperature, @humidity, @pressure)
    end
  end

  def set_mesurements(temperature, humidity, pressure)
    @temperature = temperature
    @humidity = humidity
    @pressure = pressure

    notify_observers
  end
end
