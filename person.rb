require_relative 'corrector'
require_relative 'rental'

class Person
  attr_accessor :id, :name, :age, :rentals
  attr_reader :corrector

  def initialize(age, name = 'Unknown', parent_permission = 'true')
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = Random.rand(1...10000)
    @corrector = Corrector.new
    @rentals = []
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    return true if of_age? || @parent_permission
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def add_rentals(date, book)
    Rental.new(date, self, book)
  end

  private :of_age?
end
