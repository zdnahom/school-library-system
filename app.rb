require_relative './student'
require_relative './teacher'
require_relative './rental'
require_relative './book'
require_relative './store/store_data'

class App
  attr_reader :store

  def initialize
    @store = StoreData.new

    if File.size?('./store/books.json').to_i.zero?
      @books = []
    else
      @books = @store.load_data('./store/books.json')
    end

    if File.size?('./store/people.json').to_i.zero?
      @people = []
    else
      @people = @store.load_data('./store/people.json')
    end

    if File.size?('./store/rentals.json').to_i.zero?
      @rentals = []
    else
      @rentals = @store.load_data('./store/rentals.json')
    end

  end

  def display_books
    if @books.length == 0 
      puts 'No book available!'
    else
      @books.each do |book|
        puts "Title: '#{book['title']}' , Author: #{book['author']}"
      end
    end
  end

  def display_people
    if @people.length == 0
      puts 'No person registered right now!'
    else
      @people.each do |person|
        puts "[#{person['type']}]Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
      end
    end
  end

  def add_student
    print 'Age: '
    age_input = gets.chomp

    print 'Name: '
    name_input = gets.chomp

    print 'Has parent permission? [Y/N]: '
    permission_input = gets.chomp

    student = Student.new(age_input, name_input, parent_permission: permission_input)
    student_hash = {
      'type' => 'Student',
      'id' => student.id,
      'age' => student.age,
      'name' => student.name,
      'parent_permission' => student.parent_permission,
      'rentals' => student.rentals
    }

    @people << student_hash

    @store.save_data('./store/people.json', @people)
  end

  def add_teacher
    print 'Age: '
    age_input = gets.chomp

    print 'Name: '
    name_input = gets.chomp

    print 'Specialization: '
    specialization_input = gets.chomp

    teacher = Teacher.new(specialization_input, age_input, name_input)
    teacher_hash = {
      'type' => 'Teacher',
      'id' => teacher.id,
      'specialization' => teacher.specialization,
      'age' => teacher.age,
      'name' => teacher.name,
      'parent_permission' => teacher.parent_permission,
      'rentals' => teacher.rentals
    }
    @people << teacher_hash
    @store.save_data('./store/people.json', @people)
  end

  def add_new_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    type = gets.chomp
    if type == '1'
      add_student
      puts 'Person created successfully!!'
    elsif type == '2'
      add_teacher
      puts 'Person created successfully!!'
    else
      puts 'Incorrect choice'
    end
  end

  def add_new_book
    print 'Title : '
    title_input = gets.chomp

    print 'Author : '
    author_input = gets.chomp
    book = Book.new(title_input, author_input)
    book_hash = { 'title' => book.title, 'author' => book.author, 'rentals' => book.rentals }
    @books << book_hash

    @store.save_data('./store/books.json', @books)
    puts 'Book created successfully!!'
  end

  def rent_book
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: '#{book['title']}' , Author: #{book['author']}"
    end
    book_choice = gets.chomp

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index} [#{person['type']}]Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end
    person_choice = gets.chomp

    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, @books[book_choice.to_i], @people[person_choice.to_i])
    rental_hash = { 'date' => rental.date, 'book' => rental.book, 'person' => rental.person }
    @rentals << rental_hash
    @store.save_data('./store/rentals.json', @rentals)
    puts 'Rental created successfully'
  end

  def display_rented_book
    print 'ID of person: '
    id = gets.chomp
    rentals = find_rental(id)
    puts 'Rentals: '
    rentals.each do |rental|
      puts "Date: #{rental['date']}, Book: #{rental['book']['title']} by #{rental['book']['author']}"
    end
  end

  def find_rental(id)
    rentals_by_id = []
    @rentals.each do |rental|
      person = rental['person']
      if person['id'] == id.to_i
        rentals_by_id << rental
        rentals_by_id
      end
    end
    rentals_by_id
  end
end
