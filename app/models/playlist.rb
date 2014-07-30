require 'json'

class Playlist < ActiveRecord::Base

  def self.save_into_db
  #   playlistdata = JSON.parse(File.read('simplifiedtracks1.json'))
  #   arrayofplaylisturls = playlistdata.keys
  #   arrayofplaylisturls.each do |playlisturl|
  #     Playlist.create(url: playlisturl)
  #   end
  # end

    data1 = JSON.parse(File.read('simplifiedtracks1.json'))
    data2 = JSON.parse(File.read('simplifiedtracks2.json'))
    data3 = JSON.parse(File.read('simplifiedtracks3.json'))
    data4 = JSON.parse(File.read('simplifiedtracks4.json'))
    arr1 = data1.keys
    arr2 = data2.keys
    arr3 = data3.keys
    arr4 = data4.keys
    arrayofurls = arr1+ arr2 + arr3 + arr4
    arrayofurls.each do |playlisturl|
      Playlist.create(url: playlisturl)
    end
  end

  def self.addnameandid
    # playlistpretty = JSON.parse(File.read('playlistpretty.json'))
    # counter = 1
    # while counter < 649 do
    #   playlistrow = Playlist.find(counter)
    #   theurl = playlistrow.url
    #   playlistpretty
    #   playlistrow.name = 
    #   playlistrow.spotify_id = 
    #   playlistrow.save
    #   counter += 1
    # end


  end



end

