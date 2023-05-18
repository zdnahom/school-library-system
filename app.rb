require_relative './student'
require_relative './teacher'
require_relative './rental'
require_relative './book'

class App
    def initialize
        @books = []
        @people = []
        @rentals = []
      end
  
  def display_books
    @books.each do |book|
      puts "Title: '#{book.title}' , Author: #{book.author}"
    end
  end

  def display_people
    @people.each do |person|
      puts "[#{person[0]}]Name: #{person[1].name}, ID: #{person[1].id}, Age: #{person[1].age}"
    end
  end

  def add_new_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    type = gets.chomp
    if type == '1'
      print 'Age: '
      age_input = gets.chomp

      print 'Name: '
      name_input = gets.chomp

      print 'Has parent permission? [Y/N]: '
      permission_input = gets.chomp

      permission_input = permission_input != 'n'
      student = Student.new(age_input, name_input, permission_input)
      @people.push(['Student', student])
      puts 'Person created successfully!!'
    elsif type == '2'
      print 'Age: '
      age_input = gets.chomp

      print 'Name: '
      name_input = gets.chomp

      print 'Specialization: '
      specialization_input = gets.chomp

      teacher = Teacher.new(specialization_input, age_input, name_input)
      @people.push(['Teacher', teacher])
      puts 'Person created successfully!!'
    else
      put 'Incorrect choice'
    end
  end

  def add_new_book
    print 'Title : '
    title_input = gets.chomp

    print 'Author : '
    author_input = gets.chomp

    book = Book.new(title_input, author_input)
    @books << book
    puts 'Book created successfully!!'
  end

  def rent_book
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: '#{book.title}' , Author: #{book.author}"
    end
    book_choice = gets.chomp

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person[0]}]Name: #{person[1].name}, ID: #{person[1].id}, Age: #{person[1].age}"
    end
    person_choice = gets.chomp

    print 'Date: '
    date = gets.chomp

    Rental.new(date, @books[book_choice.to_i], @people[person_choice.to_i][1])
    puts 'Rental created successfully'
  end

  def display_rented_book
    print 'ID of person: '
    id = gets.chomp
    rentals = find_rental(id)
    puts 'Rentals: '
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
  end

  def find_rental(id)
    rentals_by_id = []
    @people.each do |person|
      if person[1].id == id.to_i
        rentals_by_id = person[1].rentals
        rentals_by_id
      end
    end
    rentals_by_id
  end

end

