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
end
