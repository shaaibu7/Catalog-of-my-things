require_relative 'spec_helper'

describe MusicAlbum do
  context '#initialize' do
    it 'creates a new instance of the MusicAlbum class' do
      music = MusicAlbum.new(true)
      expect(music).to be_an_instance_of MusicAlbum
    end
  end
  context '#can_be_archived?' do
    it 'returns true if the it is true the music is no spotify' do
      music = MusicAlbum.new(true)
      expect(music.can_be_archived?).to be(true)
    end
  end
end