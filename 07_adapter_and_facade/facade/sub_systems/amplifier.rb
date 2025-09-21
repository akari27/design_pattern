class Amplifier
  def on
    puts 'アンプの電源を入れます'
  end

  def off
    puts 'アンプの電源を切ります'
  end

  def set_dvd(dvd)
    puts 'DVDプレイヤーをセットします'
  end

  def set_surround_sound
    puts 'サラウンドサウンドをセットします'
  end

  def set_volume(level)
    puts "音量を#{level}に設定します"
  end
end
