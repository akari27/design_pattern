class CaffeineBeverageWithHook
  def prepare
    boil_water
    brew
    pour_in_cup
    add_condiments if customer_wants_condiments?
  end

  def boil_water
    puts 'お湯を沸かしています'
  end

  def pour_in_cup
    puts 'カップに注いでいます'
  end

  def brew
    raise NotImplementedError, 'サブクラスで実装してください'
  end

  def add_condiments
    raise NotImplementedError, 'サブクラスで実装してください'
  end

  def customer_wants_condiments?
    true
  end
end
