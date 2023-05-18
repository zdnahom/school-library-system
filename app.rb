require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './decorators'
require_relative './rental'
require_relative './book'

class App
    @@books = []
    @@people = []

    def list_all_books
        @@books
    end
    
    def add_book(title,author)
        book = Book.new(title,author)
        @@books.push(book)
    end

    def list_all_person
        @@people
    end

    def add_person(type,age,name,specialization='Unknown',permission = 'y')
        if type == '1'
            permission = permission == 'n' ? false : true
            student = Student.new(age,name,permission)
            @@people.push(["Student",student])
        elsif type == '2'
            teacher = Teacher.new(specialization,age,name)
            @@people.push(["Teacher",teacher])
        end
    end

    def add_rental(date,book,person)
       Rental.new(date,book,person[1])
    end

    def list_rental(id)
        rentals_by_id = []
        @@people.each do |person|
            if(person[1].id == id.to_i)
                rentals_by_id = person[1].rentals
                rentals_by_id
            end
       end
       rentals_by_id
    end

end 