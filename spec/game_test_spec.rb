require_relative './helper_test'

describe Game do
  before :each do
    @game = Game.new('2005-02-02', true, '2012-01-01')
  end

  it 'Should return an instance of the game class' do
    expect(@game).to be_an_instance_of Game
  end

  it 'Should test for can be archived method' do
    expect(@game.can_be_archived?).to eq true
  end

  it 'Should return false when last_played_at is less than two years' do
    book = Game.new('2005-02-02', true, '2023-01-01')
    expect(book.can_be_archived?).to eq false
  end

  
   
end
