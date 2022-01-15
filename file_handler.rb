require 'json'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'rental'

module HandlersFile
  def load_peoples
    file = 'peoples.json'
    if File.exist? file
      JSON.parse(File.read(file)).map do |people|
        if people['instance'] == 'teacher'
          teacher = Teacher.new(people['specialization'], people['age'], people['name'])
          teacher.id = people['id']
          teacher
        else
          parent_permission = people['permission'] && true
          student = Student.new('Microverse', people['age'], people['name'], parent_permission)
          student.id = people['id']
          student
        end
      end
    else
      []
    end
  end

  def load_books
    file = 'books.json'
    if File.exist? file
      JSON.parse(File.read(file)).map do |book|
        Book.new(book['title'], book['author'])
      end
    else
      []
    end
  end

  def find_person(person)
    @peoples.each { |people| return people if people.id == person }
  end

  def find_book(title)
    @books.each { |book| return book if book.title == title }
  end

  def load_rentals
    file = 'rentals.json'
    if File.exist? file
      JSON.parse(File.read(file)).map do |rental|
        date = rental['date']
        person = find_person(rental['person'])
        book = find_book(rental['book'])
        Rental.new(date, person, book)
      end
    else
      []
    end
  end

  def poeples_to_json
    json = []
    @peoples.each do |people|
      if people.instance_of?(Teacher)
        json.push({ instance: 'teacher', id: people.id, age: people.age, name: people.name,
                    specialization: people.specialization })
      else
        json.push({ instance: 'student', id: people.id, age: people.age, name: people.name,
                    permission: people.parent_permission })
      end
    end
    open('peoples.json', 'w') { |f| f.write JSON.generate(json) }
  end

  def books_to_json
    json = []
    @books.each do |book|
      json.push({ title: book.title, author: book.author })
    end
    open('books.json', 'w') { |f| f << JSON.generate(json) }
  end

  def rentals_to_json
    json = []
    @rentals.each do |rental|
      json.push({ date: rental.date, person: rental.person.id, book: rental.book.title })
    end
    open('rentals.json', 'w') { |f| f << JSON.generate(json) }
  end

  def persist_data
    poeples_to_json unless @peoples.empty?
    books_to_json unless @books.empty?
    rentals_to_json unless @rentals.empty?
  end
end