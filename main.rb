require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'rental'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'functions'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end
end

# rubocop:disable Metrics/CyclomaticComplexity
def check_input(app)
  answer = gets.chomp.to_i
  case answer
  when 1
    listing = Functions.new(app.books)
    listing.list_books
  when 2
    listing = Functions.new(app.people)
    listing.list_people
  when 3
    create = Functions.new(app)
    create.create_person
  when 4
    create = Functions.new(app.books)
    app.books.push(create.create_book)
    puts 'Book created successfully!..'
  when 5
    create = Functions.new(app)
    app.rentals.push(create.create_rental)
  when 6
    listing = Functions.new(app)
    listing.list_rentals
  when 7
    !exit
  end
end

# rubocop:enable Metrics/CyclomaticComplexity

def welcome_msg
  puts '======= Welcom To School Library Applicaiton ======'
end

def options
  puts $/ + "please choose an option by entering the relevant number:

  1- List all books
  2- List all people
  3- Create a person
  4- Create a book
  5- Create a rental
  6- List all rentals for a given id
  7- Exit
  "
end

def main
  app = App.new
  welcome_msg
  loop do
    options
    check_input(app)
  end
end
main
