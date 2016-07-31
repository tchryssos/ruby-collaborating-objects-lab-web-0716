require_relative './song.rb'
require_relative'./mp3_importer.rb'

class Artist
  attr_accessor :name, :songs
  # @songs=[]
  @@all=[]

  def initialize(name)
    @name=name
    @songs=[]
    save
  end

  def save
    @@all<<self
  end

  def songs
    @songs
    #had issue where self.songs caused feedback loop but @songs did not
  end

  def add_song(song)
    self.songs<<song
  end

  def self.find_or_create_by_name(artist_name)
    found_artist=self.all.detect do |artist| artist.name==artist_name end
    if found_artist==nil
      Artist.new(artist_name)
    else
      found_artist
    end
  end

  def self.all
    @@all
  end

  def print_songs
    self.songs.each do |song|
      puts song.name
    end
  end

end