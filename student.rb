require_relative 'person'

class Student < Person
  attr_reader :classrom

  def initialize(classroom, age, name = 'unknown', parent_permission = 'true')
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(slef) unless  classroom.students.include?(self)
    end
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
