 require_relative './item.rb'
 
 class label < Item

  def initialize(title, color, items)
    @id = round(0..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item unless @item.exist?(item)
  end
 end
