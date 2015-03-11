class Album
  attr_reader :id, :title, :artists, :tracks

  def initialize (id, title, artists)
    @id = id
    @title = title
    @artists = artists
    @tracks = Array.new
  end

  def self.find_or_create(albums, id, name, artists)
    album = albums.find { |a| a.id == id }
    album ||= Album.new(id, name, artists)
    album
  end

  def add_track(track_id, title, number, duration)
    @tracks << Track.new(track_id, title, number, duration)
  end

  def track_list
    @tracks.map { |track| track.title }.join("\n-")
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
-#{track_list}

summary
  end

  # Extra example method to show how to use select enumerable method
  def long_tracks
    @tracks.select { |track| track.duration_ms > 240_000 }
  end

end


class Track
  attr_accessor :album_id, :track_id, :title, :track_number, :duration_ms

  def initialize (track_id, title, track_number, duration_ms)
    @track_id = track_id
    @title = title
    @track_number = track_number
    @duration_ms = duration_ms
  end

end
