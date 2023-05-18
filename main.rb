require_relative 'app'

def main
    puts "Welcome to School Library App"
    while true
        app = App.new()
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

        if choice == '1'
            books = app.list_all_books
            books.each do |book|
                puts "Title: '#{book.title}' , Author: #{book.author}"
            end
            puts
        elsif choice == '2'
            people = app.list_all_person
            people.each do |person|
                puts "[#{person[0]}]Name: #{person[1].name}, ID: #{person[1].id}, Age: #{person[1].age}"
            end
            puts
        elsif choice == '3'
            print "Do you want to create a student (1) or a teacher (2)? [Input the number]: "
            type = gets.chomp
            if type == '1'
                print "Age: "
                age = gets.chomp
                print "Name: "
                name = gets.chomp
                print "Has parent permission? [Y/N]: "
                permission = gets.chomp
                app.add_person(type,age,name,permission)
                puts "Person created successfully!!"
            elsif type == '2'
                print "Age: "
                age = gets.chomp
                print "Name: "
                name = gets.chomp
                print "Specialization: "
                specialization = gets.chomp
                app.add_person(type,age,name,specialization)
                puts "Person created successfully!!"
                puts
            else
                put "Incorrect choice"
            end
            puts
        elsif choice == '4'
            print 'Title : '
            title = gets.chomp
            print 'Author : '
            author = gets.chomp
            app.add_book(title,author)
            puts "Book created successfully!!"
            puts
        elsif choice == '5'
            puts "Select a book from the following list by number"
            books = app.list_all_books
            books.each_with_index do |book,index|
                puts "#{index}) Title: '#{book.title}' , Author: #{book.author}"
            end
            book_choice = gets.chomp

            puts "Select a person from the following list by number (not id)"
            people = app.list_all_person
            people.each_with_index do |person,index|
                puts "#{index}) [#{person[0]}]Name: #{person[1].name}, ID: #{person[1].id}, Age: #{person[1].age}"
            end
            person_choice = gets.chomp

            print "Date: "
            date = gets.chomp

            app.add_rental(date,books[book_choice.to_i],people[person_choice.to_i])
            puts "Rental created successfully"
            puts
        elsif choice == '6'
            print "ID of person: "
            id = gets.chomp
            rentals = app.list_rental(id)
            puts "Rentals: "
            rentals.each do |rental|
                puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
            end
            puts
        elsif choice == '7'
            puts "The App have been terminated, Bye!!"
            break 
        else
            puts "Invalid choice, Choose another choice"
            puts
        end
end
end

main()