require_relative '../book/book'
describe Book do
  describe 'Book Test' do
    it 'should validate all book methods' do
      set_date = '2023-05-29'
      publisher = 'Michael'
      cover_state = 'good'
      book = Book.new(set_date, publisher, cover_state)
      expect(book.nil?).to be_falsy
      condition = book.send('can_be_archived?')
      expect(condition).to be_falsy
    end

    it 'should return false when current year - 10' do
      set_date = '2002-05-29'
      publisher = 'James'
      cover_state = 'good'
      book = Book.new(set_date, publisher, cover_state)
      condition = book.send('can_be_archived?')
      expect(condition).to be_truthy
    end

    it 'should return false when current cover state is bad' do
      set_date = '2023-05-29'
      publisher = 'James'
      cover_state = 'bad'
      book = Book.new(set_date, publisher, cover_state)
      condition = book.send('can_be_archived?')
      expect(condition).to be_truthy
    end
  end
end
