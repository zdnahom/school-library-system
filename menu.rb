class Menu
  attr_reader :app

  def initialize(app)
    @app = app
  end

  def choose_option(choice)
    options = {
      '1' => method(:display_books),
      '2' => method(:display_people),
      '3' => method(:add_new_person),
      '4' => method(:add_new_book),
      '5' => method(:rent_book),
      '6' => method(:display_rented_book),
      '7' => method(:exit_app)
    }

    if options.key?(choice)
      options[choice].call
    else
      puts 'Invalid input, try again!'
    end
  end

  def display_books
    @app.display_books
  end

  def display_people
    @app.display_people
  end

  def add_new_person
    @app.add_new_person
  end

  def add_new_book
    @app.add_new_book
  end

  def rent_book
    @app.rent_book
  end

  def display_rented_book
    @app.display_rented_book
  end

  def exit_app
    puts 'The App has been terminated, Bye!!'
    exit
  end
end
