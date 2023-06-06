require 'date'
require_relative '../game/game'

RSpec.describe Game do
  let(:published_date) { '2022-01-01' }
  let(:last_played_at) { '2023-05-01' }
  let(:author_first_name) { 'John' }
  let(:title) { 'Sample Game' }

  describe '#initialize' do
    it 'sets the attributes correctly' do
      game = Game.new(title, published_date, last_played_at, author_first_name, multiplayer: true)

      expect(game.title).to eq(title)
      expect(game.multiplayer).to eq(true)
      expect(game.last_played_at).to eq(Date.parse(last_played_at))
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the game' do
      game = Game.new(title, published_date, last_played_at, author_first_name, multiplayer: false)
      expect_result = {
        id: game.id,
        title: title,
        multiplayer: false,
        last_played_at: Date.parse(last_played_at)
      }

      expect(game.to_h).to eq(expect_result)
    end
  end

  describe '#can_be_archived?' do
    context 'when last played more than 2 years ago' do
      it 'returns true' do
        last_played_2_years_ago = (Date.today - 365 * 2 - 1).to_s
        game = Game.new(title, published_date, last_played_2_years_ago, author_first_name)

        expect(game.can_be_archived?).to eq(true)
      end
    end

    context 'when last played within 2 years' do
      it 'returns false' do
        last_played_within_2_years = (Date.today - 365 - 1).to_s
        game = Game.new(title, published_date, last_played_within_2_years, author_first_name)

        expect(game.can_be_archived?).to eq(false)
      end
    end
  end
end
