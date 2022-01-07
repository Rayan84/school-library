require_relative 'person'

class Student < Person
  attr_reader :classrom

  def initialize(classroom, age, name = 'unknown', parent_permission = 'true')
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
  puts 'student here!'
end
