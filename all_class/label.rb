require_relative './item'

class Label
  def initialize(title, color)
    @id = Random.rand(0..50)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item unless @item.includes?(item)
    item.label == self unless item.label == self
  end

  def to_h
    {
      _class: self.class.name,
      object_id: object_id,
      title: @title,
      color: @color,
      items: @items
    }
  end
end
