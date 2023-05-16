require_relative './person'
require_relative './student'
require_relative './teacher'

person1 = Person.new(17, 'John')
student1 = Student.new('class-3a', 20, 'Nahom')
teacher1 = Teacher.new('Math', 20, 'Zerihun')

p person1.name
p person1.can_use_services?

p student1.name
p student1.play_hooky

p teacher1.name
p teacher1.can_use_services?
