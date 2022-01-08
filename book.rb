class Book
  attr_accessor :title, :author
  attr_reader :retnals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_students(student)
    @student.push(student)
    student.classroom = self
  end

  def add_rentals(date, person)
    Rental.new(date, person, self)
  end

end
