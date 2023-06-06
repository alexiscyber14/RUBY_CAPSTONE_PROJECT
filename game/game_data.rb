require_relative 'game'
require_relative 'author'
require_relative '../render'
require 'json'

class AddGame
  def initialize
    @authors = []
    @games = []
    ensure_files_exist
    load_data
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
    game = Game.new(game_title, publish_date, last_played, author_first_name, multiplayer: multiplayer)
    game.author = author

    @games << game
    save_data
    puts "Game (#{game.title}) has been successfully created."
  end

  def list_games
    if games.empty?
      puts 'There are no games.'
    else
      games.each do |game|
        puts "Game: #{game.title.capitalize} | Publish Date: #{game.publish_date}"
      end
    end
  end

  def list_all_authors
    if authors.empty?
      puts 'There are no authors.'
    else
      authors.each do |author|
        puts "Author: #{author.first_name.capitalize} #{author.last_name.capitalize}"
      end
    end
  end

  private

  def ensure_files_exist
    ['author.json', 'games.json'].each do |filename|
      File.write(filename, '[]') unless File.exist?(filename)
    end
  end

  def load_data
    authors_data = load_file_data('author.json')
    games_data = load_file_data('games.json')

    authors_data.each do |author_hash|
      authors << Author.new(author_hash['first_name'], author_hash['last_name'])
    end

    games_data.each do |game_hash|
      author = authors.find { |a| a.full_name == game_hash['author_name'] }
      games << Game.new(
        game_hash['title'],
        game_hash['publish_date'],
        game_hash['last_played'],
        author,
        multiplayer: game_hash['multiplayer']
      )
    end
  end

  def load_file_data(filename)
    if File.exist?(filename)
      json_data = File.read(filename)
      JSON.parse(json_data)
    else
      puts "Could not find #{filename}. Error 404."
      []
    end
  end

  def find_or_create_author(first_name, last_name)
    author = authors.find { |a| a.full_name == "#{first_name} #{last_name}" }

    unless author
      author = Author.new(first_name, last_name)
      authors << author
      save_data
    end

    author
  end

  def save_data
    serialized_authors = authors.map(&:to_h)
    File.write('author.json', JSON.generate(serialized_authors))

    serialized_games = games.map(&:to_h)
    File.write('games.json', JSON.generate(serialized_games))
  end

  attr_reader :authors, :games
end
