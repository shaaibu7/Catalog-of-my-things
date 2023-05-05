require_relative '../all_class/book'

describe Book do
  context 'Create an instance of book class and test its method' do
    it 'Should create an instance of the book class' do
      book = Book.new('2023-11-12', 'sammy', 'good')
      expect(book).to be_a Book
    end

    it 'Should test the book if it can be archived method' do
      book = Book.new('2022-11-12', 'sammy', 'bad')
      expect(book.can_be_archived?).to eq true
    end
  end
end
