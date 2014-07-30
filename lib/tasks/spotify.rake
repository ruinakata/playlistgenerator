namespace :spotify do
  desc "TODO"
  task update: :environment do
  
      playlistpretty = JSON.parse(File.read('playlistpretty.json'))

    playlistpretty.each do |playlist|
      playlisturl = playlist["url"] + "tracks"
      playlistwanted = Playlist.find_by_url(playlisturl)
      p playlistwanted
      next if playlistwanted == nil 
      playlistwanted.name = playlist["name"]
      playlistwanted.spotify_id = playlist["spotify_id"]
#      playlistwanted.save 
      p playlistwanted

    end


  end

end
