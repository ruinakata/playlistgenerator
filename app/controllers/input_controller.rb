require 'json'

class InputController < ApplicationController

  def input
  end

  def show_playlist
    @artist = "me"
  end

  def make_playlist
    @artists = input_params
    # redirect_to '/playlistgenerator'

      jaccardlist = {}
      arrayofusersongnames = input_params
      playlist_id = 1
      while playlist_id < 100 
        playlisttracks = Track.where(playlist_id: playlist_id)
        arrayofplaylistsongnames = playlisttracks.map {|track| track.artist}
        intersect = arrayofusersongnames & arrayofplaylistsongnames
        union = arrayofusersongnames | arrayofplaylistsongnames
        jaccard = intersect.length.to_f / union.length.to_f
        print "The jaccard index for playlist #{playlist_id} is #{jaccard}"
        if jaccard > 0.01
          jaccardlist[playlist_id] = jaccard
        end
        playlist_id += 1 
      end
      

      arrayofarrays = jaccardlist.sort_by{|k,v| v}.reverse
      firstplaylist = arrayofarrays[0]
      playlistid = firstplaylist[0]
      score = firstplaylist[1]

  end

private
  
  def input_params
    params.require(:artists)
  end


end
