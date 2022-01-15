# !/usr/bin/env ruby
require_relative 'handler'
require_relative 'file_handler'

class Program
  include Handlers
  include HandlersFile

  def initialize
    @peoples = load_peoples
    @books = load_books
    @rentals = load_rentals
  end

  def display_welcome
    puts 'Welcome to School Library App!'
    puts "\n"
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def run
    case gets.chomp
    when '1'
      list_books(@books)
    when '2'
      list_all_peoples(@peoples)
    when '3'
      @peoples.push(create_person)
    when '4'
      create_book
    when '5'
      @rentals.push(create_rental(@books, @peoples.last))
      puts "\n"
    when '6'
      list_rental(@peoples)
    when '7'
      persist_data
      !exit
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end

def main
  program = Program.new
  loop do
    program.display_welcome
    program.run
  end
end

main
