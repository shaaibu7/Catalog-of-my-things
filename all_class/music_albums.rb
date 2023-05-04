require_relative './item'
require 'json'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name, :id

  def initialize(on_spotify, publish_date = 'Unknown')
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    @on_spotify == true && super
  end
end
