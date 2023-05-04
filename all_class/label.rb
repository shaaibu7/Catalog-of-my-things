require_relative './item'

class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color)
    @id = rand(0..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item unless @items.exist?(item)
    item.label = self
  end

  def to_json(*arg)
    {
      JSON.create_id => self.class.name,
      'a' => [title, color]
    }.to_json(*arg)
  end

  def json_create(object)
    new(*object['a'])
  end
end
