require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'rental'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'functions'
require 'json'
require 'pp'

class App
  attr_accessor :people, :books, :rentals, :people_file, :books_file, :rentals_file

  def initialize
    @people = []
    @books = []
    @rentals = []
    @people_file = false
    @books_file = false
    @rentals_file = false
  end
end

def preserve_data(session)
  # people
  people_array = []
  if session.people_file == true
    people_json_file = File.open('people.json', 'a')
    puts 'open append'
  else
    people_json_file = File.new('people.json', 'w')
    puts 'new write'
  end
  people_hash = {}
  people_hash = {
    'id' => '',
    'name' => '',
    'age' => '',
    'parent_permissiom' => '',
    'specialization' => ''
  }
  session.people.each do |person|
    people_hash['name'] = person.name
    people_hash['id'] = person.id
    people_hash['age'] = person.age
    people_array.push(people_hash)
  end
  people_json_file.write(JSON.pretty_generate(people_array))

  # books
  books_file = File.open('books.json', 'w')
  books = []
  session.books.each do |book|
    book = {
      title: book.title,
      author: book.author
    }
    books.push(book)
  end
  books_file.write(JSON.pretty_generate(books))

  # rentals
  rentals = File.new('rentals.json', 'w')
  rentals.write(session.rentals.to_s)
end

def load_data(application)
  if File.exist?('books.json')
    puts 'books.json exists'
    application.books_file = true
    unless File.zero?('books.json')

      puts 'loading books...'
      books_file = File.open('books.json', 'r')
      books = books_file.read
      parsed_books = JSON.parse(books)
      puts books
      puts parsed_books

      parsed_books.each do |book|
        p 'book title is: '
        puts book['title']
        # puts book.title
        p 'book author is: '
        puts book['author']
        application.books.push(Book.new(book['title'], book['author']))
      end
    end
  end
  puts 'people.json exists' if File.exist?('people.json')
  application.people_file = true
  if File.exist?('rentals.json')
    puts 'rentals.json exists'
    application.rentals_file = true
  end
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
    puts app.people
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
  welcome_msg
  app = App.new
  load_data(app)

  loop do
    options
    check_input(app)
  end
  File.close('people.json')
end
main
