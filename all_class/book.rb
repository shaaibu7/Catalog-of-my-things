require_relative './item'

class Book
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state)
    super
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    can_be_archived? || cover_state == 'bad'
  end
end
