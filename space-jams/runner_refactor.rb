require 'csv'
require 'set'
require_relative 'album_refactor'
require 'pry'


albums = Set.new

CSV.foreach('space_jams.csv', headers: true, header_converters: :symbol) do |row|
  album = Album.find_or_create(albums, row[:album_id].to_i,
                               row[:album_name], row[:artists])

  album.add_track(row[:track_id], row[:title], row[:track_number].to_i,
                  row[:duration_ms].to_f)

  albums.add(album)
end

# print out the summary for each album
albums.each do |album|
  puts album.summary
end
