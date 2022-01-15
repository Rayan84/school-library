class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    puts 'creating rental...'
    puts date
    puts person.name
    puts person.id
    puts book.title
    @date = date
    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
  end
end
