require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './decorators'
require_relative './rental'
require_relative './book'

class App
    @@books = []
    def list_all_books
        @@books.each do |book|
            puts "Title: '#{book.title}' , Author: #{book.author}"
        end
    end
    
    def add_book(title,author)
        book = Book.new(title,author)
        @@books.push(book)
    end

end 