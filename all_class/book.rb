require_relative './item.rb'

class Book
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super
    can_be_archived? || cover_state == 'bad' ? true : false
  end
end