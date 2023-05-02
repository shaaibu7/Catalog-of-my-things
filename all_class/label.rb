require_relative './item'

class Label < Item
  def initialize(title, color, _items)
    super
    @id = round(0..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item unless @item.exist?(item)
  end
end
