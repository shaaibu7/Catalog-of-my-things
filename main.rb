require_relative './app/app'

class Main
  app = App.new

  key = ''

  until key == '8'
    app.show_menu
    key = gets.chomp
    app.run(key)
  end
  puts 'Well come to our Application'
end
