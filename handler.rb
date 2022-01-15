require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'rental'

module Handlers
  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    classroom = Classroom.new('Microverse')
    Student.new(classroom, age, name, parent_permission)
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    Teacher.new(specialization, age, name)
  end

  def create_person
    print 'Do you want to create (1) a student or teacher (2)? [Input the number]: '
    person = gets.chomp

    case person
    when '1'
      create_student
    when '2'
      create_teacher
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    print 'The book was successfully created! '
  end

  def create_rental(books, person)
    puts 'Select a book from the following list by number'
    books.each_with_index do |book, i|
      puts "#{i}) Title: #{book.title}, Author: #{book.author}"
    end
    book = books[gets.chomp.to_i]
    print 'Date: '
    date = gets.chomp
    Rental.new(date, person, book)
  end

  def list_books(books)
    books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
    puts "\n"
  end

  def list_all_peoples(peoples)
    peoples.each do |people|
      puts "[#{people.class.name}] Name: #{people.name}, ID: #{people.id}, Age: #{people.age}"
    end
    puts "\n"
  end

  def list_rental(peoples)
    print 'Id of person: '
    id = gets.chomp
    peoples.each do |people|
      next unless people.id == id.to_i

      people.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title}, by #{rental.book.author}"
      end
    end
    puts "\n"
  end
end
