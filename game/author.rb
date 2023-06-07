require_relative '../item'

class Author
  attr_reader :id
  attr_accessor :first_name, :last_name, :items

  def initialize(id = rand(1..1000), first_name, last_name)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def to_h
    {
      id: @id,
      first_name: @first_name,
      last_name: @last_name,
      items: @items.map(&:to_h)
    }
  end

  def add_item(item)
    @items << item
    item.author = self
  end
end
