require_relative './helper_test'
require_relative '../all_class/author'
require_relative '../all_class/item'

describe Author do
  before :each do
    @author = Author.new('Shaaibu', 'Suleiman')
  end
  context 'Testing for author class and its methods' do
    it 'Should create an instance of the author class' do
      expect(@author).to be_an_instance_of Author
    end

    it 'Should add an item to the item array' do
      @item = Item.new('2011-12-12')
      @item.add_author(@author)
      expect(@author.items).to include(@item)
    end
  end
end
