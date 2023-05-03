require 'date'

class Item
  attr_reader :id, :archived, :genre, :author, :source, :label, :publish_date

  def initialize(publish_date)
    @id = Random.rand(0..50)
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    (Time.now.year - Date.parse(@publish_date).year) > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.items.exist?(self)
  end

  def author=(author)
    @author = author
    author.items << self unless author.items.exist?(self)
  end

  def source=(source)
    @source = source
    source.items << self unless source.items.exist?(self)
  end

  def add_label(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end
end
