require_relative 'app'
require_relative 'menu_displayer'
require_relative 'menu'

def main
  app = App.new
  puts 'Welcome to School Library App'
  menu_displayer = MenuDisplayer.new
  menu = Menu.new(app)

  loop do
    puts
    menu_displayer.display()
    choice = gets.chomp
    menu.choose_option(choice)
  end
end

main
