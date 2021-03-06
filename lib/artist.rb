class Artist
    extend Concerns::Findable
    
    attr_accessor :name

    @@all = []
 

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.destroy_all
        self.all.clear
    end

    def self.create(name)
        artist = Artist.new(name)
        # artist.name = name
        artist.save
        artist
    end

    def songs
       @songs
    end

    def add_song(song)
        song.artist = self if song.artist == nil   #or you could do unless song.artist
        songs << song unless songs.include?(song)
    end

    def genres
        songs.collect {|song| song.genre}.uniq
    end

end