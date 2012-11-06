# encoding: utf-8

class Song
  def self.play
    "Play from Song"
  end
end

module ModSong
  class Song
    def play
      "Play from ModSong"
    end
  end
end

puts Song.play
song = ModSong::Song.new
puts song.play