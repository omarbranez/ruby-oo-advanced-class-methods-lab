class Song  #class of Song
  attr_accessor :name, :artist_name #read and write both song names and artist names
  @@all = []  #class variable named all, an array

  def self.all #allows the instance of self to access the class variable all
    @@all
  end

  def save # save the current instance
    self.class.all << self  # push the argument of the current instance into the class variable all
  end

  def self.create
    song = Song.new # creates new instance in the Song class. This can be a shorthand string.
    song.save #runs save on that current instance, which pushes it into the all array
    song 
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end  
  
  def self.find_by_name(name_query)
      self.all.find{|song_name| song_name.name == name_query}
  end

  def self.find_or_create_by_name(name_query)
      if self.find_by_name(name_query).nil? #find returns nil if it is falsey
        self.create_by_name(name_query) #run create_by_name if the song doesn't exist
      else
        self.find_by_name(name_query)  #return the find_by_name result
    # self.find_by_name(name_query) || self.create_by_name(name_query) #can you use || between methods? true method vs false method?
      # end  
      end  
    end

  def self.alphabetical
      self.all.sort_by{|song_names| song_names.name} #run sort_by on all
      #sort_by's syntax is {|object| block}. in this case, on the name key in @@all
  end

  def self.new_from_filename(song_filename)
      broken_filename = song_filename.split(/\.|\s-\s/)
      brk_song_name = broken_filename[1]
      brk_artists_name = broken_filename[0]
      song = self.new
      song.name = brk_song_name
      song.artist_name = brk_artists_name
      song
  end

  def self.create_from_filename(song_filename)
    broken_filename = song_filename.split(/\.|\s-\s/)
    brk_song_name = broken_filename[1]
    brk_artists_name = broken_filename[0]
    song = self.create
    song.name = brk_song_name
    song.artist_name = brk_artists_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
