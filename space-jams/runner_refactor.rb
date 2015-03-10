require 'csv'
require 'pry'
require 'set'
require_relative 'album_refactor'


albums = Set.new

CSV.foreach('space_jams.csv', headers: true, header_converters: :symbol) do |row|
  album = Album.find_or_create(row[:album_id], row[:album_name], row[:artists])
  album.add_track(track[:track_id], track[:title], track[:track_number], track[:duration_ms])

  albums.add(album)
  # album = albums.find { |a| a.id == track[:album_id] }
  #
  # # if the album hasn't been added to the albums array yet, add it
  # if album.nil?
  #   album = Album.new(track[:album_id], track[:album_name], track[:artists])
  #   albums << album
  # end

  # add the track to the album's @tracks instance variable
  # album.tracks << Track.new(track[:album_id], track[:track_id], track[:title], track[:track_number], track[:duration_ms])
end

# print out the summary for each album
albums.each do |album|
  puts album.summary
end
