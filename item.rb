require 'date'

class Item
  attr_reader :genre, :author, :label
  attr_accessor :publish_date

  def initialize(publish_date)
    @id = rand(1..1000)
    @publish_date = Date.parse(publish_date) 
    @archived = false
  end

  def genre=(genre)
    @genre = genre
    @genre.items.push(self) unless @genre.items.include?(self)
  end

  def author=(author)
    @author = author
    @author.items.push(self) unless @author.items.include?(self)
  end

  def label=(label)
    @label = label
    @label.items.push(self) unless @label.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    current_date = Date.today
    return true if @publish_date < Date.new(current_date.year - 10, current_date.month, current_date.day)

    false
  end
end