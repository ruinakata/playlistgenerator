Rails.application.routes.draw do

  root to: 'input#input'
  get '/playlist' => 'input#show_playlist'
  post '/playlist' => 'input#make_playlist'

  get '/playlist2' => 'input#show_playlist'
  post '/playlist2' => 'input#makeotherplaylist'

  get '/explain' => 'input#explain'

end
