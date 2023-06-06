require_relative '../game/author'

RSpec.describe Author do
  let(:author) { Author.new('John', 'Doe') }
  let(:item) { double('Item') }

  describe '#initialize' do
    it 'assigns a random id' do
      expect(author.id).to be_between(1, 1000)
    end

    it 'assigns the first name' do
      expect(author.first_name).to eq('John')
    end

    it 'assigns the last name' do
      expect(author.last_name).to eq('Doe')
    end

    it 'initializes an empty array for items' do
      expect(author.items).to be_an(Array)
      expect(author.items).to be_empty
    end
  end

  describe '#full_name' do
    it 'returns the full name of the author' do
      expect(author.full_name).to eq('John Doe')
    end
  end

  describe "#to_h" do
    it 'returns a hash representation of the author' do
      expected_hash = {
        id: be_between(1, 1000),
        first_name: 'John',
        last_name: 'Doe',
        items: []
      }
      expect(author.to_h).to include(expected_hash)
    end
  end
end
