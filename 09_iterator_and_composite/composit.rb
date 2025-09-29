class MenuItem
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

class Menu
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

class Waitress
  def initialize(all_menus)
    @all_menus = all_menus
  end

  def print_menu
    @all_menus.print
  end
end

pancake_house_menu = Menu.new('PANCAKE HOUSE MENU', '朝食')
diner_menu = Menu.new('DINER MENU', '昼食')
cafe_menu = Menu.new('CAFE MENU', '夕食')
dessert_menu = Menu.new('DESSERT MENU', 'もちろんデザートも！')

all_menus = Menu.new('ALL MENUS', 'すべてのメニューの統合')
all_menus.add(pancake_house_menu)
all_menus.add(diner_menu)
all_menus.add(cafe_menu)

cafe_menu.add(MenuItem.new('ベジタリアンBLT', 'レタスとトマト、ベジタリアンベーコンのサンドイッチ', true, 2.99))
cafe_menu.add(dessert_menu)
dessert_menu.add(MenuItem.new('アップルパイ', 'バニラアイスクリーム添え', true, 1.59))

waitress = Waitress.new(all_menus)
waitress.print_menu
