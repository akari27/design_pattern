class Stereo
  def on
    puts 'ステレオが起動しました'
  end

  def off
    puts 'ステレオが停止しました'
  end

  def set_cd
    puts 'CDをセットしました'
  end

  def set_volume(volume)
    puts "音量を#{volume}に設定しました"
  end
end
