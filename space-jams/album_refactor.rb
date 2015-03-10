class Album
  attr_reader :id, :title, :artists, :tracks

  def initialize (id, title, artists)
    @id = id
    @title = title
    @artists = artists
    @tracks = Array.new
  end

  def find_or_create(id, name, artists)
    self.find { |a| a.id == track[:album_id] }
    #
    # # if the album hasn't been added to the albums array yet, add it
    # if album.nil?
    #   album = Album.new(track[:album_id], track[:album_name], track[:artists])
    #   albums << album
    # end

    # add the track to the album's @tracks instance variable
    # album.tracks << Track.new(track[:album_id], track[:track_id], track[:title], track[:track_number], track[:duration_ms])



  end


  # Example method to show how to use select enumerable method
  # def long_tracks
  #   @tracks.select { |track| track.duration_ms > 240_000 }
  # end

  def track_list
    @tracks.map { |track| track.title }.join("\t -") + "\n"
  end

  def duration_milliseconds
    @tracks.reduce(0) { |total, track| total + track.duration_ms }
  end

  def duration_seconds
    duration_milliseconds / 1000.0
  end

  def duration_min
    Time.at(duration_seconds).strftime("%M:%S")
  end

  def summary
    <<-summary
    Name: #{@title}
    Artist(s): #{@artists}
    Duration (min): #{duration_min}
    Tracks:
    #{track_list}

    summary
  end
end

class Track
  attr_accessor :album_id, :track_id, :title, :track_number, :duration_ms

  def initialize (album_id, track_id, title, track_number, duration_ms)
    @album_id = album_id
    @track_id = track_id
    @title = title
    @track_number = track_number
    @duration_ms = duration_ms
  end

end
