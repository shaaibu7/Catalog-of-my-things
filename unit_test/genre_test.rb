require_relative 'spec_helper'

describe Genre do
  context '#initialize' do
    it 'creates a new instance of the Genre class' do
      genre = Genre.new('action')
      expect(genre).to be_an_instance_of Genre
    end
  end
  context '#add_item' do
    it 'sets the genre of an Item class\' instance to the instance of the Genre class' do
      genre = Genre.new('action')
      item = Item.new('2012/08/10')
      new_genre = genre.add_item(item)
      expect(new_genre.items[0].genre).to eq genre
    end
  end
end