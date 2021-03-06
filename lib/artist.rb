require_relative './concerns/findable.rb'
class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  attr_writer :genres
  @@all = []
  def initialize(name)
    @name = name
    @songs = []

  end
  def self.all
    @@all
  end
  def self.destroy_all
    @@all.clear
  end
  def save
    @@all << self
  end
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
  def add_song(song)
    if !@songs.include? song
      @songs << song
      song.artist = self
    else
      if !song.artist
        song.artist = self
      end
    end
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq

  end
end
