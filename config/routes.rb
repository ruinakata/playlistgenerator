Rails.application.routes.draw do

  root to: 'input#input'
  get '/playlist' => 'input#show_playlist'
  post '/playlist' => 'input#make_playlist'

end
