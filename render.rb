
require_relative 'game_data'
require_relative 'book/book_ui'
require_relative './modules/check_files_existence'
require_relative './music/music_ui'

class Render
  include Files
  def initialize
    check_files_existence
    @game_data = AddGame.new
    @book_ui = BookUI.new
    @music_ui = MusicUI.new
  end

  def actions
    options = [
      '1 - List all books',
      '2 - List all music albums',
      '3 - List all games',
      "4 - List all genres(e.g 'Comedy', 'Thriller')",
      "5 - List all labels(e.g 'Gift', 'New')",
      "6 - List all authors(e.g 'Stephen King')",
      '7 - Add a book',
      '8 - Add a music album',
      '9 - Add a game',
      '10 - Exit'
    ]
    puts options
  end

  def get_request(message, input_type = :to_s)
    print message
    input = gets.chomp
    input_type == :to_i ? input.to_i : input
  end

  def execute_action(choice)
    case choice
    when 1
      @book_ui.list_books
    when 2
      @music_ui.list_music_albums
    when 4
      @music_ui.list_genres
    when 5
      @book_ui.list_labels
    when 7
      @book_ui.create_book
    when 8
      @music_ui.loop_create_music_album
    when 9
      @game_data.create_game
    end
  end
end
