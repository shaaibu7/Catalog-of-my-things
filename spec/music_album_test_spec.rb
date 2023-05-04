require_relative 'helper_test'

describe MusicAlbum do
  context '#initialize' do
    it 'creates a new instance of the MusicAlbum class' do
      music = MusicAlbum.new(true, '2023-12-1')
      expect(music).to be_an_instance_of MusicAlbum
    end
  end
  context '#can_be_archived?' do
    it 'returns true if the it is true the music is no spotify' do
      music = MusicAlbum.new(true, '2011-12-1')
      expect(music.can_be_archived?).to eq true
    end
  end
end
