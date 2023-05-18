require_relative 'app'

def main
  app = App.new
  puts 'Welcome to School Library App'
  loop do
    puts " Please choose an option by entering a number:
        1 - List all books
        2 - List all people
        3 - Create a person
        4 - Create a book
        5 - Create a rental
        6 - List all rentals for a given person id
        7 - Exit
        "
    choice = gets.chomp

    case choice
    when '1'
      app.display_books
      puts
    when '2'
      app.display_people
      puts
    when '3'
      app.add_new_person
      puts
    when '4'
      app.add_new_book
      puts
    when '5'
      app.rent_book
      puts
    when '6'
      app.display_rented_book
      puts
    when '7'
      puts 'The App has been terminated, Bye!!'
      break
    else
      puts 'Invalid choice, Choose another choice'
      puts
    end
  end
end

main
