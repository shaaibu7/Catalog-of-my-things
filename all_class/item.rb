require 'Date'

class Item
  attr_reader :archived, :genre, :author, :source, :label

  def initialize(publish_date)
    @id = round(0..1000)
    @publish_date = Date.parse(publish_date)
    @archived = false
  end

  def can_be_archived?
    time = Date.today
    num_year = time.year - @publish_date.year
    num_year > 10
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

  def label=(label)
    @label = label
    label.items << self unless label.items.exist?(self)
  end
end
