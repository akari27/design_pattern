class MenuItem
  attr_reader :name, :description, :vegetarian, :price

  def initialize(name, description, vegetarian, price)
    @name = name
    @description = description
    @vegetarian = vegetarian
    @price = price
  end
end

class PancakeHouseMenu
  attr_reader :menu_items

  def initialize
    @menu_items = []
    add_item("K&B'のパンケーキ朝食", 'スクランブルエッグとトーストのパンケーキ', true, 2.99)
    add_item('レギュラーパンケーキ朝食', 'フライドエッグとソーセージのパンケーキ', false, 2.99)
    add_item('ブルーベリーパンケーキ', '新鮮なブルーベリーを使ったパンケーキ', true, 3.49)
    add_item('ワッフル', 'ブルーベリーまたはイチゴを選べるワッフル', true, 3.59)
  end

  def add_item(name, description, vegetarian, price)
    menu_item = MenuItem.new(name, description, vegetarian, price)
    @menu_items << menu_item
  end

  def create_iterator
    PancakeHouseMenuIterator.new(@menu_items)
  end
end

class DinerMenu
  MAX_ITEMS = 6
  attr_reader :menu_items

  def initialize
    @menu_items = {}
    add_item('ベジタリアンBLT', 'レタスとトマト、ベジタリアンベーコンのサンドイッチ', true, 2.99)
    add_item('BLT', 'レタスとトマト、ベーコンのサンドイッチ', false, 2.99)
    add_item('本日のスープ', 'ポテトサラダを添えた本日のスープ', false, 3.29)
    add_item('ホットドッグ', 'ザワークラウト、レリッシュ、玉ねぎ、チーズを添えたホットドッグ', false, 3.05)
  end

  def add_item(name, description, vegetarian, price)
    if @menu_items.length < MAX_ITEMS
      menu_item = MenuItem.new(name, description, vegetarian, price)
      @menu_items[name] = menu_item
    else
      puts 'メニューが最大値に達しました。これ以上追加できません。'
    end
  end

  def create_iterator
    DinerMenuIterator.new(@menu_items)
  end
end

pancake_house_menu = PancakeHouseMenu.new
puts pancake_house_menu.menu_items.class

diner_menu = DinerMenu.new
puts diner_menu.menu_items.class

class PancakeHouseMenuIterator
  def initialize(menu_items)
    @menu_items = menu_items
    @position = 0
  end

  def has_next?
    @position < @menu_items.length
  end

  def next
    menu_item = @menu_items[@position]
    @position += 1
    menu_item
  end
end

class DinerMenuIterator
  def initialize(menu_items)
    @menu_items = menu_items
    @position = 0
  end

  def has_next?
    @position < @menu_items.length
  end

  def next
    menu_item = @menu_items.values[@position]
    @position += 1
    menu_item
  end
end

class Waitress
  def initialize(menus)
    @menus = menus
  end

  def print_menu
    menu_iterator = @menus.map(&:create_iterator)

    while menu_iterator.any?(&:has_next?)
      menu_iterator.each do |iterator|
        if iterator.has_next?
          menu_item = iterator.next
          puts "#{menu_item.name}, #{menu_item.price} -- #{menu_item.description}"
        end
      end
    end
  end

  private

  def print_menu_items(iterator)
    while iterator.has_next?
      menu_item = iterator.next
      puts "#{menu_item.name}, #{menu_item.price} -- #{menu_item.description}"
    end
  end
end

class CafeMenu
  attr_reader :menu_items

  def initialize
    @menu_items = []
    add_item('野菜バーガーとフライドポテト', '全粒小麦パンにレタス、トマト、アボカドを挟んだバーガー', true, 3.99)
    add_item('本日のスープ', 'サラダつき', false, 3.69)
    add_item('ブリトー', 'チリとチーズをたっぷり詰めたブリトー', true, 4.29)
  end

  def add_item(name, description, vegetarian, price)
    menu_item = MenuItem.new(name, description, vegetarian, price)
    @menu_items << menu_item
  end

  def create_iterator
    CafeMenuIterator.new(@menu_items)
  end
end

class CafeMenuIterator
  def initialize(menu_items)
    @menu_items = menu_items
    @position = 0
  end

  def has_next?
    @position < @menu_items.length
  end

  def next
    menu_item = @menu_items[@position]
    @position += 1
    menu_item
  end
end

pancake_house_menu = PancakeHouseMenu.new
diner_menu = DinerMenu.new
cafe_menu = CafeMenu.new
waitress = Waitress.new([pancake_house_menu, diner_menu, cafe_menu])
waitress.print_menu

# Compositeパターン実装途中 P.364~
class MenuComponent
  def add(menu_component); end

  def remove(menu_component); end

  def get_child(i); end

  def name; end

  def description; end

  def price; end

  def is_vegetarian; end

  def print; end
end

class MenuItem < MenuComponent
  attr_reader :name, :description, :vegetarian, :price

  def initialize(name, description, vegetarian, price)
    @name = name
    @description = description
    @vegetarian = vegetarian
    @price = price
  end

  def is_vegetarian
    @vegetarian
  end

  def print
    puts "  #{@name}#{' (v)' if is_vegetarian}, #{@price}"
    puts "     -- #{@description}"
  end
end

class Menu < MenuComponent
  attr_reader :name, :description

  def initialize(name, description)
    @name = name
    @description = description
    @menu_components = []
  end

  def add(menu_component)
    @menu_components << menu_component
  end

  def remove(menu_component)
    @menu_components.delete(menu_component)
  end

  def get_child(i)
    @menu_components[i]
  end

  def print
    puts "\n#{@name}, #{@description}"
    puts '---------------------'
    @menu_components.each(&:print)
  end
end
