require_relative 'book'
require_relative 'teacher'

class Functions
  def initialize(items)
    @items = items
  end

  def list_books
    puts 'List of the books: '
    @items.books.each do |item|
      puts "Title: #{item.title}, Author: #{item.author}"
    end
  end

  def list_people
    @items.people.each do |item|
      if item.class == Teacher
        puts "[#{item.class}] Name: #{item.name}, ID: #{item.id}, Age: #{item.age}"
      else
        puts "[#{item.class}] Name: #{item.name}, ID: #{item.id}, Age: #{item.age}" 
      end
    end
    puts "\n"
  end

  def create_book
    print 'Please enter book title: '
    title = gets.chomp.to_s
    print 'Please enter book author: '
    author = gets.chomp.to_s
    @items.books.push(Book.new(title, author))
    puts 'Book created successfully!..'
  end

  def create_person
    puts "Do you want to create a teacher or a student? please enter the relevant number:
    1- Teacher
    2- Student
    "
    answer = gets.chomp.to_i
    case answer
    when 1
      puts 'You chose teacher'
      create_teacher(@items.people)
    when 2
      create_student(@items.people)
    else
      puts 'please enter 1 or 2'
    end
  end

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
    positive = ['y', 'Y', 'yes', 'Yes', 'YES']
    negative = ['n', 'N', 'no', 'No', 'NO']
    permission = ''
    loop do 
      print "Parent's permission? [Y/N]: "
      permission = gets.chomp
      break if ['y', 'Y', 'yes', 'Yes', 'YES', 'n', 'N', 'no', 'No', 'NO'].include?(permission)
    end
    if positive.include?(permission)
      permission = true
    else
      permission = false
    end

    people.push(Student.new(permission, age, name))
    puts 'Person created successfully!'
  end

  def list_rentals
    puts 'please enter the id'
    id = gets.chomp
    @items.people.each do |person|
      next unless person.id == id.to_i

      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title}, by #{rental.book.author}"
      end
    end
  end

  def create_rental
    puts 'Choose a book: '
    @items.books.each_with_index do |book, i|
      puts "#{i} Title: #{book.title}, Author: #{book.author}"
    end
    book = @items.books[gets.chomp.to_i]
    puts 'Choose a person: '
    @items.people.each_with_index do |person, i|
      puts "#{i} [#{person.class}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
    rentee = @items.people[gets.chomp.to_i]

    print 'Date: '
    date = gets.chomp
    @items.rentals.push(Rental.new(date, rentee, book))
    puts rentee
    puts book
    puts 'Rental created succefully'
  end
end
