require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './decorators'
require_relative './rental'
require_relative './book'


person = Person.new(22, 'maximilianus')
p person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
p capitalized_trimmed_person.correct_name

person1 = Person.new(17,'nahom')
person2 = Person.new(17,'zerihun')
book1 = Book.new('the book','znahom')
person1.add_rental('2020-01-01',book1)
book1.add_rental('2020-05-01',person2)

p person1.rentals.count
p book1.rentals.map{|rental| rental.person.name}
