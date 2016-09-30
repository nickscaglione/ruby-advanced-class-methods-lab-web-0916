### Tests pass, refactoring needed

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    (Song.all << Song.new).last
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song ||= self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort { |song1, song2| song1.name > song2.name ? 1 : -1}
  end

  def self.filename_to_artist_song(file)
    file.gsub(".mp3","").split(" - ")
  end

  def self.new_from_filename(file)
    new_song = Song.new_by_name(filename_to_artist_song(file)[1])
    new_song.artist_name = filename_to_artist_song(file)[0]
    new_song
  end

  def self.create_from_filename(file)
    new_song = Song.create_by_name(filename_to_artist_song(file)[1])
    new_song.artist_name = filename_to_artist_song(file)[0]
    new_song
  end

  def self.destroy_all
    @@all.clear
  end

end
