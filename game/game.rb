require 'date'
require_relative '../item'

class Game < Item
  attr_reader :id
  attr_accessor :title, :multiplayer, :last_played_at

  def initialize(title, published_date, last_played_at, author_first_name, multiplayer: nil)
    super(published_date)
    @id = rand(1..100)
    @title = title
    @last_played_at = Date.parse(last_played_at)
    @author_first_name = author_first_name
    @multiplayer = multiplayer
  end

  def to_h
    {
      id: @id,
      title: @title,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at
    }
  end

  def can_be_archived?
    return true if @last_played_at < (Date.today - (365 * 2))

    false
  end
end
