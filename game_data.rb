require_relative 'game'
require_relative 'author'
require_relative 'render'

class AddGame
  def initialize
    @authors = []
    @items = []
  end

  def create_game
    request = Render.new
    game_title = request.get_request('Enter game title: ')
    publish_date = request.get_request('Enter game publish date [YYYY-MM-DD]: ')
    multiplayer = request.get_request('Does it have multiplayer? (y/n): ')
    last_played = request.get_request('Enter game last played date [YYYY-MM-DD]: ')
    author_first_name = request.get_request("Enter creator's first name: ")
    author_last_name = request.get_request("Enter creator's last name: ")

    author = find_or_create_author(author_first_name, author_last_name)
    game = Game.new(game_title, publish_date, last_played, multiplayer: multiplayer)
    game.author = author

    @items << game
    puts "Game, (#{game.title}) has been successfully created"
  end

  private

  def find_or_create_author(first_name, last_name)
    author = @authors.find { |a| a.first_name == first_name && a.last_name == last_name }

    unless author
      author = Author.new(first_name, last_name)
      @authors << author
    end

    author
  end
end
