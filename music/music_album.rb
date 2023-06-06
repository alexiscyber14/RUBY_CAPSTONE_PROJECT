require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify: false)
    @on_spotify = on_spotify
    super(publish_date)
  end

  def can_be_archived?
    @on_spotify == true && super
  end
end
