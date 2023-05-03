require_relative './item'

class Label
  attr_reader :id, :title, :color, :items, :label
  def initialize(title, color)
    @id = Random.rand(0..50)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item unless @item.include?(item)
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
