require_relative './book'
require_relative './label'
require_relative './preserve_data'
require_relative './game'
require_relative './author'
require 'date'

class App
  def initialize
    @books = read_file('./data/book.json')
    @labels = read_file('./data/label.json')
    @games = read_file('./data/game.json')
    @authors = read_file('./data/author.json')
  end

  def list_books
    @books = read_file('./data/book.json')
    puts 'No books yet' if @books.empty?
    @books.each do |book|
      puts "BookID: #{book['object_id']} Publisher: #{book['publisher']} and Cover_state: #{book['cover_state']}"
    end
  end

  def list_labels
    @labels = read_file('./data/label.json')
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

  def create_game
    puts '--------Create game---------'
    puts 'Enter game publication date: [yyyy/mm/dd]'
    publish_date = Date.parse(gets.chomp)
    puts 'Is the game a multiplayer mode:[true/false]'
    multiplayer = gets.chomp
    if multiplayer == 'true'
      multiplayer = true
    else 
      multiplayer = false
    end
    puts 'When was this game last played: [yyyy/mm/dd]'
    last_played_at = Date.parse(gets.chomp)
    @games << Game.new(publish_date, multiplayer, last_played_at)
    write_file(@games, './data/game.json')
    puts 'Game created successfully'
  end

  def list_games
    @games = read_file('./data/game.json')
    puts 'No games at the moment' if @games.empty?
    @games.each do |game|
      puts "GameID: #{game['object_id']} publish_data: #{game['publish_date']} multiplayer: #{game['multiplayer']} last_played_at: #{game['last_played_at']}"
    end
  end

  def create_author
    puts '----------Create author---------'
    puts 'Enter firstname'
    first_name = gets.chomp
    puts 'Enter last_name'
    last_name = gets.chomp
    @authors << Author.new(first_name, last_name)
    write_file(@authors, './data/author.json')
    puts 'Author created successfully'
  end

  def list_authors
    @author = read_file('./data/author.json')
    puts 'No authors at the moment' if @author.empty?
    @author.each do |author|
      puts "AuthorID: #{author['object_id']} firstname: #{author['first_name']} last_name: #{author['last_name']} "
    end
  end

  def exit_app
    puts '============================='
    puts 'Thank you for using this app!'
    puts '============================='
    exit
  end
end
