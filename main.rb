require_relative './all_class/app'

def welcome
  puts '================================='
  puts 'Welcome to your catalog of things'
  puts '================================='
end

def display_options
  puts 'Please choose an option by entering a number'
  puts '1. List all books'
  puts '2. List all labels'
  puts '3. List music album'
  puts '4. List authors'
  puts '5. List games'
  puts '6. List genre'
  puts '7. Create a book'
  puts '8. Create label'
  puts '9. Create game'
  puts '10. Create author'
  puts '11. Create music album'
  puts '12. Create genre'
  puts '0. quit the application'
end

def run_program(option, app)
  case option
  when '1'
    app.list_books
  when '2'
    app.list_labels
  when '3'
    app.list_music_album
  when '4'
    app.list_authors
  when '5'
    app.list_games
  when '6'
    app.list_genre
  when '7'
    app.create_book
  when '8'
    app.create_label
  when '9'
    app.create_game
  when '10'
    app.create_author
  when '11'
    app.add_music_album
  when '12'
    app.create_genre
  else
    puts 'You entered a wrong input'
  end
end

def main
  app = App.new
  welcome
  loop do
    display_options
    option = gets.chomp
    if option == '0'
      app.exit_app
    else
      run_program(option, app)
    end
  end
end

main
