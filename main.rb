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
  puts '3. Add a book'
  puts '4. Create label'
  puts '5. Create game'
  puts '6. List games'
  puts '7. Create author'
  puts '8. List authors'
  puts '9. quit the application'
end

def run_program(option, app)
  case option
  when '1'
    app.list_books
  when '2'
    app.list_labels
  when '3'
    app.create_book
  when '4'
    app.create_label
  when '5'
    app.create_game
  when '6'
    app.list_games
  when '7'
    app.create_author
  when '8'
    app.list_authors
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
    if option == '9'
      app.exit_app
    else
      run_program(option, app)
    end
  end
end

main
