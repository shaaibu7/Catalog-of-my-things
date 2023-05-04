class Author
  attr_reader :id, :first_name, :last_name, :item, :author
  def initialize(first_name, last_name)
    id = Random.rand(1..100)
    @first_name = first_name
    @last_name = last_name
    items = []
  end

  def add_item(item)
    @items << item
    item.author = self unless item.author = self
  end
end