require_relative 'person.rb'

class Student < Person
  attr_reader :classrom
  
  def initialize(classroom, age, name = 'unknown', parent_permission = 'true')
    super
    @classroom = classroom
  end

  def play_hooky
    return "¯\(ツ)/¯"
  end



  puts 'student here!'
end


student = Student.new(12)
student.setName=("Adam")

puts student.name
puts student.is_of_age?