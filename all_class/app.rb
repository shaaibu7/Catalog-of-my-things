require_relative './book'
require_relative './label'
require_relative './preserve_data'
require 'date'

class App
  def initialize
    @books = read_file('./data/book.json')
    @labels = read_file('./data/label.json')
  end

  def list_books
    @books = read_file('./data/book.json')
    puts 'No books yet' if @books.empty?
    @books.each do |book|
      puts "BookID: #{book['object_id']} Publisher: #{book['publisher']} and Cover_state: #{book['cover_state']}"
    end
  end

  def list_labels
    puts 'No label at the moment' if @labels.empty?
    @labels.each do |label|
      puts "LabelID: #{label['object_id']} Title: #{label['title']} Color: #{label['color']} items: #{label['items']}"
    end
  end

  def create_book
    puts '--------Creating book---------'
    puts 'Publisher'
    publisher = gets.chomp
    puts 'Cover_state'
    cover_state = gets.chomp
    puts 'Enter the date in a format like yyyy/mm/dd'
    publish_date = Date.parse(gets.chomp)
    @books << Book.new(publish_date, publisher, cover_state)
    write_file(@books, './data/book.json')
    puts 'Book created successfully'
  end

  def create_label
    puts '---------Create label---------'
    puts 'Title'
    title = gets.chomp
    puts 'Color'
    color = gets.chomp
    @labels << Label.new(title, color)
    write_file(@labels, './data/label.json')
    puts 'Label created sucessfully'
  end

  def exit_app
    puts '============================='
    puts 'Thank you for using this app!'
    puts '============================='
    exit
  end
end
