class Track < ActiveRecord::Base
  searchkick

  def self.save_into_db

    # playlistdata1 = JSON.parse(File.read('simplifiedtracks1.json'))
    # playlistdata2 = JSON.parse(File.read('simplifiedtracks2.json'))
     playlistdata3 = JSON.parse(File.read('simplifiedtracks3.json'))
    # playlistdata4 = JSON.parse(File.read('simplifiedtracks4.json'))
    
    # urlarrays = playlistdata1.keys
    # urlarrays.each do |url|
    #   arrayoftrackobjects = playlistdata1[url]
    #   arrayoftrackobjects.each do |track|
    #     playlistwanted = Playlist.find_by_url(url)
    #     plid = playlistwanted.id
    #     p Track.create(playlist_id: plid, artist: track["artist"], name: track["name"], spotify_id: track["spotify_id"], preview_url: track["preview_url"])
    #   end
    # end
###############################################################################################
    
    # urlarrays = playlistdata2.keys
    # urlarrays.each do |url|
    #   arrayoftrackobjects = playlistdata2[url]
    #   arrayoftrackobjects.each do |track|
    #     playlistwanted = Playlist.find_by_url(url)
    #     plid = playlistwanted.id
    #      Track.create(playlist_id: plid, artist: track["artist"], name: track["name"], spotify_id: track["spotify_id"], preview_url: track["preview_url"])
    #   end
    # end
    # Track.count
########################################################################################################
    
    urlarrays = playlistdata3.keys
    urlarrays.each do |url|
      arrayoftrackobjects = playlistdata3[url]
      arrayoftrackobjects.each do |track|
        playlistwanted = Playlist.find_by_url(url)
        plid = playlistwanted.id
         Track.create(playlist_id: plid, artist: track["artist"], name: track["name"], spotify_id: track["spotify_id"], preview_url: track["preview_url"])
      end
    end
    Track.count
################################################################################################
    
    # urlarrays = playlistdata4.keys
    # urlarrays.each do |url|
    #   arrayoftrackobjects = playlistdata4[url]
    #   arrayoftrackobjects.each do |track|
    #     playlistwanted = Playlist.find_by_url(url)
    #     plid = playlistwanted.id
    #      Track.create(playlist_id: plid, artist: track["artist"], name: track["name"], spotify_id: track["spotify_id"], preview_url: track["preview_url"])
    #   end
    # end
    # Track.count



  end

end


