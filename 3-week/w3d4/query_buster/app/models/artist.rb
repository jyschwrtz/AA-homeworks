class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    new_table = albums
                  .select('albums.*, COUNT(*) AS track_count')
                  .joins(:tracks)
                  .group('albums.id')
    track_count_hash = Hash.new
    new_table.each do |album_and_count|
      album = album_and_count.title
      count = album_and_count.track_count
      track_count_hash[album] = count
    end

    track_count_hash
  end
end
