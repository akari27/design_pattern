class DvdPlayer
  def on
    puts 'DVDプレイヤーの電源を入れます'
  end

  def off
    puts 'DVDプレイヤーの電源を切ります'
  end

  def play(movie)
    puts "#{movie}を再生します"
  end

  def stop
    puts 'DVDを停止します'
  end

  def eject
    puts 'DVDを取り出します'
  end
end
