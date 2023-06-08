require 'rspec'
require_relative '../music/genre'

describe Genre do
  let(:name) { 'Test Genre' }
  let(:id) { 1 }
  let(:genre) { described_class.new(name, id) }

  describe '#initialize' do
    it 'initializes a new Genre object with the given parameters' do
      expect(genre).to be_a(Genre)
      expect(genre.name).to eq(name)
      expect(genre.id).to eq(id)
      expect(genre.items).to be_empty
    end
  end

  describe '#add_item' do
    let(:item) { double('Item', add_genre: nil, genre: nil) }

    it 'adds the item to the genre if it is not already present' do
      expect(genre.items).to be_empty
      genre.add_item(item)
      expect(genre.items).to include(item)
    end

    it 'does not add the item to the genre if it is already present' do
      genre.add_item(item)
      expect(genre.items).to include(item)
      expect(genre.items.size).to eq(1)
      genre.add_item(item)
      expect(genre.items.size).to eq(1)
    end

    it 'calls #add_genre on the item with self as an argument if the item does not have this genre' do
      expect(item).to receive(:add_genre).with(genre)
      genre.add_item(item)
    end

    it 'does not call #add_genre on the item if the item already has this genre' do
      allow(item).to receive(:genre).and_return(genre)
      expect(item).not_to receive(:add_genre)
      genre.add_item(item)
    end
  end
end
