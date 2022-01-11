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
end