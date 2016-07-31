require 'pry'
require_relative './song.rb'
require_relative './artist.rb'

class MP3Importer
  attr_accessor :path

  def initialize(file_path)
    @path=file_path
  end

  def import
    files.each do |file_name|
      Song.new_by_filename(file_name)
    end
  end

  def files
    Dir.entries(self.path).select do |file|
      file.include?(".mp3")
    end
  end

end