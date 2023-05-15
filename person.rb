class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @parent_permission = parent_permission
    @age = age
  end

  attr_reader :id
  attr_accessor :name, :age

  def can_use_services?
    if of_age? or @parent_permission
      true
    else
      false
    end
  end

  private

  def of_age?
    @age >= 18
  end
end
