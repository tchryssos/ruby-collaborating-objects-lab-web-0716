require 'pry'
require_relative './artist.rb'
require_relative'./mp3_importer.rb'

class Song
  attr_accessor :name, :artist
  @@all=[]

  def initialize(name)
    @name=name
    @@all<<self
  end

  def artist_name=(artist_name)
    selected_artist=Artist.find_or_create_by_name(artist_name)
    self.artist=selected_artist
    selected_artist.add_song(self)
  end

  def self.new_by_filename(file_name)
    filename_song=Song.new(file_name.split(" - ")[1])
    filename_song.artist_name=(file_name.split(" - ")[0])
    filename_song
  end

  def self.all
    @@all
  end
end