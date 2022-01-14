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
  puts 'saving person data...'
  people_file = File.open('people.json', 'w')
  people_array = []
  session.people.each do |person|
    if person.class == Student
      puts 'person class is :'
      puts person.class
      person = {
        id: person.id,
        age: person.age,
        name: person.name,
        #parent_permission: person.parent_permission,
        class: person.class
        }
     else 
        person = {
          id: person.id,
          name: person.name,
          age: person.age,
          specialization: person.specialization,
          class: person.class
        }
      

    end
      
    people_array.push(person)
  end
  people_file.write(JSON.pretty_generate(people_array))

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
  # books json
  if File.exist?('books.json')
    puts 'books.json exists'
    application.books_file = true
    unless File.zero?('books.json')

      puts 'loading books...'
      books_file = File.open('books.json', 'r')
      books = books_file.read
      parsed_books = JSON.parse(books)
      parsed_books.each do |book|
        application.books.push(Book.new(book['title'], book['author']))
      end
    end
  end

  #people json
  if File.exist?('people.json')
    puts 'people.json exists'
    application.people_file = true
    unless File.zero?('people.json')
      puts 'loading people...'
      people_file = File.open('people.json', 'r')
      people = people_file.read()
      #puts people
      people_parsed = JSON.parse(people)
      #puts people_parsed
      people_parsed.each do |person|
        print 'person name is: '
        puts person['name']
        print 'person id is: '
        puts person['id']
        print 'person age is: '
        puts person['age']
        if person['class'] == 'Student'
          puts 'retrieved person class is student'
          application.people.push(Student.new('Y', person['age'], person['name']))
          # application.people.push({
          #   id: person['id'],
          #   name: person['name'],
          #   age: person['age'],
          #   class: person['class']
          #   })
        else
        #  puts 'retrieved person class is Teacher '
          application.people.push(Teacher.new(person['specialization'], person['age'], person['name']))
        end
      end
    end
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
