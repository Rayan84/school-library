require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'rental'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'functions'

def create_teacher(people)
  print 'Please enter the name: '
  teacher_name = gets.chomp.to_s
  print 'Please enter the age: '
  teacher_age = gets.chomp.to_s
  print 'Specialization: '
  specialization = gets.chomp.to_s
  people.push(Teacher.new(specialization, teacher_age, teacher_name))
  puts 'Person created successfuly!'
end

def create_student(people)
  print 'Please enter the name: '
  name = gets.chomp.to_s
  print 'Please enter the age: '
  age = gets.chomp.to_i
  print "Parent's permission? [Y/N]: "
  permission = gets.chomp
  people.push(Student.new(age, name, permission))
  puts 'Persone created successfully!'
end

def create_person(people)
  puts "Do you want to create a teacher or a student, please enter the relevant number:
  1- Teacher
  2- Student
  "
  answer = gets.chomp.to_i
  case answer
  when 1
    puts 'You chose teacher'
    create_teacher(people)
  when 2
    create_student(people)
  else
    puts 'please enter 1 or 2'
  end
end

def create_book(books)
  create = Functions.new(books)
  books.push(create.create_book)
  puts 'Book created successfully!..'
end

def create_rental(books, people, rentals)
  puts 'Choose a book: '
  books.each_with_index do |book, i|
    puts "#{i} Title: #{book.title}, Author: #{book.author}"
  end
  book = books[gets.chomp.to_i]
  puts 'Choose a person: '
  people.each_with_index do |person, i|
    puts "#{i} [#{person.class}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
  end
  lessor = people[gets.chomp.to_i]

  print 'Date: '
  date = gets.chomp
  rentals.push(Rental.new(date, lessor, book))
  puts 'Rental created succefully'
end

def list_rentals(people)
  puts 'please enter the id'
  id = gets.chomp
  people.each do |person|
    next unless person.id == id.to_i

    person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title}, by #{rental.book.author}"
    end
  end
end

# rubocop:disable Metrics/CyclomaticComplexity
def check_input(books, people, rentals)
  answer = gets.chomp.to_i
  case answer
  when 1
    listing = Functions.new(books)
    listing.list_books
  when 2
    listing = Functions.new(people)
    listing.list_people
  when 3
    create_person(people)
  when 4
    create_book(books)
  when 5
    create_rental(books, people, rentals)
  when 6
    list_rentals(people)
  when 7
    !exit
  end
end

# rubocop:enable Metrics/CyclomaticComplexity

def welcome_msg
  puts "======= Welcom To School Library Applicaiton ======"
end

def options
  puts $/+"please choose an option by entering the relevant number:

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
  books = []
  people = []
  rentals = []
  welcome_msg
  loop do
    options
    check_input(books, people, rentals)
  end
end
main
