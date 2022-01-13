require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'rental'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'functions'
require 'json'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end
end

def preserve_data(session)
  people = File.new('people.json', 'w')
  people.write(session.people.to_s.to_json)

  books = File.new('books.json', 'w')
  books.write(session.books.to_s.to_json)

  rentals = File.new('rentals.json', 'w')
  rentals.write(session.rentals.to_s.to_json)
end

# rubocop:disable Metrics/CyclomaticComplexity
def check_input(app)
  answer = gets.chomp.to_i
  functions_instance = Functions.new(app)
  case answer
  when 1
    functions_instance.list_books
  when 2
    functions_instance.list_people
  when 3
    functions_instance.create_person
  when 4
    functions_instance.create_book
  when 5
    app.rentals.push(functions_instance.create_rental)
  when 6
    functions_instance.list_rentals
  when 7
    preserve_data(app)
    puts 'See you soon'
    !exit
  end
end
# rubocop:enable Metrics/CyclomaticComplexity

def welcome_msg
  puts '======= Welcom To School Library Applicaiton ======'
end

def options
  puts ' '
  puts 'please choose an option by entering the relevant number:

  1- List all books
  2- List all people
  3- Create a person
  4- Create a book
  5- Create a rental
  6- List all rentals for a given id
  7- Exit
  '
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
