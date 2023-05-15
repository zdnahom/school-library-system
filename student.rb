require_relative "./person.rb"

class Student < Person
    def initialize(classroom,age,name="Unknown",parent_permission:true)
        super(age, name, parent_permission:true)
        @classroom = classroom
    end

    attr_accessor :classroom

    def play_hooky
        "¯\(ツ)/¯"
    end
end