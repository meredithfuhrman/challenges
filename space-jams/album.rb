class Album
  def initialize (album_id, album_title, album_artists)
    @album_id = album_id
    @album_title = album_title
    @album_artists = album_artists
    @track = Array.new
  end

  def id
    @album_id
  end

  def tracks
    @track
  end

  def track_list
    track_list = ""
    @track.each { |track| track_list += "\t- #{track[:title]}\n"}
    track_list
  end

  def duration_min
    album_duration_ms = 0
    tracks.each {|track| album_duration_ms += track[:duration_ms].to_f}
    album_duration_sec = album_duration_ms/1000
    Time.at(album_duration_sec).strftime("%M:%S")
  end


  def summary
    <<-summary
    Name: #{@album_title}
    Artist(s): #{@album_artists}
    Duration (min): #{duration_min}
    Tracks:
    #{track_list}

    summary
  end

end
