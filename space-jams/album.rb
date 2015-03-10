class Album
  attr_accessor :id, :title, :artists, :tracks

  def initialize (album_id, album_title, album_artists)
    @id = album_id
    @title = album_title
    @artists = album_artists
    @tracks = Array.new
  end

  def track_list
    track_list = ""
    @tracks.each { |track| track_list += "\t- #{track.title}\n"}
    track_list
  end

  def duration_min
    album_duration_ms = 0
    @tracks.each {|track| album_duration_ms += track.duration_ms.to_f}
    album_duration_sec = album_duration_ms/1000
    Time.at(album_duration_sec).strftime("%M:%S")
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
