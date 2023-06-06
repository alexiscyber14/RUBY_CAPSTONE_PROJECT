require 'date'
require_relative '../item'

class Game < Item
  attr_reader :id
  attr_accessor :title, :multiplayer, :last_played_at, :publish_date

  def initialize(title, publish_date, last_played_at, author_id, multiplayer: nil)
    super(publish_date)
    @id = rand(1..100)
    @title = title
    @last_played_at = last_played_at
    @publish_date = publish_date
    @author_id = author_id
    @multiplayer = multiplayer
  end

  def to_h
    {
      id: @id,
      title: @title,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at,
      publish_date: @publish_date,
      author_id: @author_id
    }
  end

  def can_be_archived?
    return true if Date.parse(@last_played_at) < (Date.today - (365 * 2))

    false
  end
end
