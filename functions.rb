require_relative 'book'

class Functions
  def initialize(items)
    @items = items
  end

  def list_books
    puts 'List of the books: '
    @items.each do |item|
      puts "Title: #{item.title}, Author: #{item.author}"
    end
    puts "\n"
  end

  def list_people
    @items.each do |item|
      puts "[#{item.class}] Name: #{item.name}, ID: #{item.id}, Age: #{item.age}"
    end
  end

  def create_book
    print 'Please enter book title: '
    title = gets.chomp.to_s
    print 'Please enter book author: '
    author = gets.chomp.to_s
    new_book = Book.new(title, author)
    return new_book
  end
end
