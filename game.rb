require 'date'
require_relative 'item'

class Game < Item
  attr_accessor :title, :multiplayer, :last_played_at

  def initialize(title, published_date, last_played_at, multiplayer: nil)
    super(published_date)
    @id = rand(1..100)
    @title = title
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
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
    super && @last_played_at < 2.years.ago
  end
end
