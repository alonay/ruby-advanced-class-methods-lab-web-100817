class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.name = name
    @@all << song
    song

  end
  def Song.new_by_name(name)

    song = self.new
    song.name = name
    @@all << self
    song
  end

  def save
    self.class.all << self
  end

  def Song.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def Song.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def Song.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  def Song.alphabetical
    @@all.sort_by!{ |song| song.name.downcase }
  end
  def Song.new_from_filename(file_name)
    song = self.new
    split_array = file_name.split" - "
    name = split_array[1].split(".")[0]
    artist_name = split_array[0]
    song.name = name
    song.artist_name= artist_name
    song
  end
  def Song.create_from_filename(file_name)
    song = self.new
    split_array = file_name.split" - "
    name = split_array[1].split(".")[0]
    artist_name = split_array[0]
    song.name = name
    song.artist_name= artist_name
    song
    @@all << song

  end
  def self.destroy_all
    self.all.clear
  end
end
