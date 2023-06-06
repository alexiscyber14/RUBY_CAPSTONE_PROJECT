require_relative './genre'
require_relative './music_album'

class MusicUI
  def initialize
    @genres = []
    @music_albums = []
  end

  def list_genres
    system 'cls'
    if @genres.empty?
      puts 'No genres found'.center(32)
      return
    end
    puts 'Genres'.center(32)
    count = 0
    @genres.each do |genre|
      puts "#{count += 1}: #{genre.name}"
    end
    print 'press any key to return to the main menu... : '
    gets
    system 'cls'
  end

  def list_music_albums
    system 'cls'
    if @music_albums.empty?
      puts 'No music albums found'.center(32)
      return
    end
    puts 'Music Albums'.center(32)
    count = 0
    @music_albums.each do |album|
      puts "#{count += 1}: #{album.title} "
    end
    print 'press any key to return to the main menu... : '
    gets
    system 'cls'
  end

  def create_music_album
    print 'Enter album title: '
    album_title = gets.chomp
    print 'Enter album publish date (yy-mm-dd): '
    album_publish_date = gets.chomp
    print 'Enter album genre: '
    album_genre = gets.chomp
    print 'Is the album on spotify? (y/n): '
    respone = gets.chomp
    album_on_spotify = respone == 'y' || response == 'Y'
    album = MusicAlbum.new(album_title, album_publish_date, on_spotify: album_on_spotify)
    genre = Genre.new(album_genre)
    album.add_genre(genre)
    @music_albums.push(album)
    @genres.push(genre)
  end

  def loop_create_music_album
    loop do
      system 'cls'
      puts 'Create a music album'.center(32)
      create_music_album
      system 'cls'
      puts 'Album created successfully'.center(32)
      puts '1: Add another album'
      puts '2: Return to main menu'
      print 'Enter your choice: '
      response = gets.chomp.to_i
      if response == 2
        system 'cls'
        break
      end
      system 'cls'
    end
  end
end