class InputController < ApplicationController

  def input
  end

  def show_playlist
    @artist = "me"
  end

  def make_playlist
    @artist1 = input_params[:artist1] 
    # redirect_to '/playlistgenerator'
  end

private
  
  def input_params
    params.require(:artist).permit(:artist1, :artist2, :artist3, :artist4, :artist5, :artist6, :artist7, :artist8, :artist9, :artist10)
    # now looks like {:1 => "Echosmith", :2 =>}
  end


end
