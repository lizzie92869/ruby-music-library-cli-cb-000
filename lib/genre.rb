class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

    @@all = []

    def initialize(name)
      @name = name
      @songs = []
    end

    def artists
      artists = []
      @songs.each {|song| artists << song.artist unless song.artist == nil}
      artists.uniq
    end

    def songs
      @songs
    end

    def save
      @@all << self
    end

    def self.all
      @@all
    end

    def self.destroy_all
      @@all.clear
    end

    def self.create(name)
      genre = Genre.new(name)
      genre.save
      genre
    end

end
