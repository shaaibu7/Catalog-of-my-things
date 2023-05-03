require_relative '../all_class/label'

describe Label do
  before :each do
    @label = Label.new('sticker', 'red')
  end
  context 'Create an instance of the label class and test its methods' do
    it 'Should return an instance of the Label class' do
      expect(@label).to be_a Label
    end

    it 'Should add an item to the item array' do
      @item = Item.new('2023-11-3')
      @item.add_label(@label)
      expect(@label.items).to include(@item)
    end
  end
end
