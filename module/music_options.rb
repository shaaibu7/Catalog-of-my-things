require_relative '../all_class/music_album'
require_relative '../all_class/genre'

module MusicModule
  def add_album
    print 'Enter album Name: '
    name = gets.chomp
    print 'Enter album genre: '
    genre = gets.chomp
    print 'Enter publish date: '
    publish_date = gets.chomp
    print 'is it on Spotify? [Y/N]: '
    on_spotify = gets.chomp.downcase
    on_spotify = on_spotify == 'y'
    MusicAlbum.new(on_spotify)
    new_genre = Genre.new(genre)

    music_struct = ItemStruct.new(name: name, genre: genre, publish_date: publish_date,
                                  on_spotify: on_spotify)
    json = JSON.generate(music_struct)
    @musics << json
    File.write('musics.json', @musics)

    @genres << new_genre
    puts '*************** Music add successfully!!***************'
  end

  def list_all_genres
    @musics = JSON.parse(File.read('musics.json')) if File.exist?('musics.json') && !File.empty?('musics.json')
    if @musics.empty?
      puts ''
    else
      puts 'All saved music'
      puts "---------------\n"
      @musics.each_with_index do |music, index|
        music = JSON.parse(music, create_additions: true)
        puts "#{index + 1})  the genre of \"#{music.item['name']}\" is: #{music.item['genre']}."
      end
    end
  end

  def list_all_music_albums
    @musics = JSON.parse(File.read('musics.json')) if File.exist?('musics.json') && !File.empty?('musics.json')
    if @musics.empty?
      puts 'No music currently saved'
    else
      puts 'All saved music'
      puts "---------------\n"
      @musics.each_with_index do |music, index|
        music = JSON.parse(music, create_additions: true)
        puts "#{index + 1}) \"#{music.item['name']}\", genre: #{music.item['genre']},
        publish_date: #{music.item['publish_date']},on_spotify: #{music.item['on_spotify']}."
      end
    end
  end
end
