require_relative 'app'

OPTIONS = "Please choose an option by entering a number:
1 - List all books
2 - List all people
3 - Create a person
4 - Create a book
5 - Create a rental
6 - List all rentals for a given person id
7 - Exit
".freeze

def main
  app = App.new
  puts 'Welcome to School Library App'
  loop do
    puts
    puts OPTIONS
    choice = gets.chomp
    run_app(app, choice)
  end
end

def run_app(app, choice)
  case choice
  when '1'
    app.display_books
  when '2'
    app.display_people
  when '3'
    app.add_new_person
  when '4'
    app.add_new_book
  when '5'
    app.rent_book
  when '6'
    app.display_rented_book
  when '7'
    puts 'The App has been terminated, Bye!!'
    exit
  else
    puts 'Invalid choice, Choose another choice'
  end
end

# def terminate_app
#   puts 'The App has been terminated, Bye!!'
#   break
# end

main
