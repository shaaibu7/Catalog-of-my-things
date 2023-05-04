require_relative './helper_test'

describe Game do
  before :each do
    @game = Game.new('2005-02-02', 'Modern Warfare', true, '2012-01-01')
    @genre = Genre.new('Rock')
  end

  it 'sets the last_played_at, name, multiplayer, publish_date' do
    expect(@game.name).to eq 'Modern Warfare'
    expect(@game.multiplayer).to eq true
    expect(@game.publish_date).to eq Date.parse('2005-02-02')
    expect(@game.last_played_at).to eq Date.parse('2012-01-01')
  end

  it 'returns true if the game was last played more than 2 years ago' do
    expect(@game.can_be_archived?).to eq true
  end

  it 'sets the archived attribute to true' do
    @game.move_to_archive
    expect(@game.archived).to eq true
  end

  it 'sets the author' do
    author = Author.new('John', 'Doe')
    @game.author = author
    expect(@game.author).to eq author
  end

  it 'adds the game to the author items' do
    author = Author.new('John', 'Doe')
    @game.author = author
    expect(author.items.length).to eq 1
  end
end
