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

end 