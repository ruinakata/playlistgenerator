require 'unirest'
require 'json'

# Part 1  *************************************************************************************

# loop to get playlists (get it working with a single one first)
# Lookup spotify api limits (probably need to stop kicking and sleep between requests)
# sleep 2
# Convert results to json
# Save json results to file


#The rate limit is currently 10 request per second per ip
#1 request every 0.1 sec => 1000 ms in sec  sleep every 100ms

# GET https://api.spotify.com/v1/users/!!!!username!!!/playlists/


  
 
fbfriends = %w{ruinakata hpatel13 wayspurrchen allison.marie.hammond 1258866041 1230927257 matthewmaysonet 121672770 1219825601 rocksteady1313 1240855449 djrebase 1218843405 1217235967 1258548537 stetyldic eddiemoney1 125539967 thebandito 123710650 allsop207 124405909 124954713 glory14 quinlanroyce 1211188147 121992691 1226635310 catmandabomb 1258925414 129291504 129833991 122815469 mhanley24 sstamler alexheiman 121425691 1242463522 125809126 ruecritchfield 1211822090 1236500795 1238460903 127891280 mattyszucs 1246917672 122298282 1254509207 1220992694 1242558506 123277527 123879796 ncolakhodzic 1285470950 1283658077 1210178120 1236558710 1226179565 126845875 122183838 125130791 1162898832 122027052 122742594 129369849 alexyee 123481630 1241859798 121683424 1224655375 1212199050 127486916 126542648 129456138 121534226 claystewart abigail.sellman 1218148862 1262756194 1233291878 psant r00sey koalabluejay 127499807 1240201407 1255601907 124477988 1211600533 1238710040 121486749 1236382966 1227405034 1220596670 1249385828 nsthorat 1264990391 derk924 frwct1 123306050 1245921668 dboyd435 1246182483 1272625775 Epiphone353 elainelin edvard_m boogalooboo 121103283 mcs1992 lmljoe lizyeomans assiagrazioli lnards magerleagues karlashnikov beengan jonathan.tarlton}
tastemakers = %w{elainelin edvard_m boogalooboo 121103283 mcs1992 lmljoe lizyeomans assiagrazioli lnards magerleagues karlashnikov beengan jonathan.tarlton}
playlistdata = []

playlists = []

fbfriends.each do |friend|
  sleep 0.2
  puts "GET users/#{friend}/playlists"
  response = Unirest.get("https://api.spotify.com/v1/users/#{friend}/playlists/",
    headers:{"Authorization" => "Bearer BQDKDM5nKP51ZfxRvAvqxjMIO2jSq3mMMgPWwnPqnZiRCyKSXXZxQoUmvXUSC6lOYjnwnSOnEalUTsQjkZRJRmrsjcgJ63DMLPGWkqAwA3GXK4f56kiZjsYfRvQJ6OxyX-X59ZLJDaLfsZZ_DOZt3jE"}
  ).body
  if response["items"] == nil 
    puts "Oops #{response.inspect}"
  else
    puts "Got #{response["items"].count} playlists"
    playlists += response["items"]  
  end
end

File.write('playlists.json', JSON.dump({ playlists: playlists }) )

# Part 2  *************************************************************************************


accesstoken = "BQDc5KtWHxBp8AyCcqt0jgRCt2cJpG1qPEGRZdhPhdFS980Jdcaw9w3zSSn0zn_L8mSveooJFHNZNdTwqicjHfTUUVTbIT1nLBFkeIy9CV2eEGfG004byJbSHSy0VMT7ucpm63ZXMRKTZLoDWtAouos"

alldata = File.read('playlists.json')

rubyuserdata = JSON.parse(alldata)
urlarray = []
urlarrayforeach = []
tracks = {}

arrayofplaylists = rubyuserdata["playlists"]
arrayofplaylists.each do |playlist|
  urlarray << playlist["tracks"]["href"]
end

# File.write('urls.json', JSON.dump(urlarray))

####################### NEXT PART ##########################################


theurls = JSON.parse( File.read('urls.json') )
theurls1 = theurls[0..706]
theurls2 = theurls[707..1413]
theurls3 = theurls[1414..2120]
theurls4 = theurls[2121..2828]
playlists = {}
i = 1







# theurls1.each do |urlstring|
#   sleep 0.2
#   puts "GET urlstring"
#   response = Unirest.get(urlstring, 
#     headers: {"Authorization" => "Bearer #{accesstoken}"}
#     ).body
#     puts "Got response from #{i}"
#     i+=1
#     playlists[urlstring] = response["items"]
# end
# File.write('tracks1.json', JSON.dump(playlists))


# i = 1
# theurls2.each do |urlstring|
#   sleep 0.2
#   puts "GET urlstring"
#   response = Unirest.get(urlstring, 
#     headers: {"Authorization" => "Bearer #{accesstoken}"}
#     ).body
#     puts "Got response from #{i}"
#     i+=1
#     playlists[urlstring] = response["items"]
# end
# File.write('tracks2.json', JSON.dump(playlists))


i = 1
theurls3.each do |urlstring|
  sleep 0.2
  puts "GET urlstring"
  response = Unirest.get(urlstring, 
    headers: {"Authorization" => "Bearer #{accesstoken}"}
    ).body
    puts "Got response from #{i}"
    i+=1
    playlists[urlstring] = response["items"]
end
File.write('tracks3.json', JSON.dump(playlists))

i = 1
theurls4.each do |urlstring|
  sleep 0.2
  puts "GET urlstring"
  response = Unirest.get(urlstring, 
    headers: {"Authorization" => "Bearer #{accesstoken}"}
    ).body
    puts "Got response from #{i}"
    i+=1
    playlists[urlstring] = response["items"]
end
File.write('tracks4.json', JSON.dump(playlists))




# Part 3  *************************************************************************************



print "Loading JSON... "

 alldata1 = File.read('tracks1.json')
 # alldata2 = File.read('tracks2.json')
 # alldata3 = File.read('tracks3.json')
 #  alldata4 = File.read('tracks4.json')
puts "done."


print "Parsing JSON... "
rubytracksarray1 = JSON.parse(alldata1)  
# rubytracksarray2 = JSON.parse(alldata2)
#rubytracksarray3 = JSON.parse(alldata3)
 #rubytracksarray4 = JSON.parse(alldata4)
puts "done."

# allrubytracks = [rubytracksarray1, rubytracksarray2, rubytracksarray3, rubytracksarray4]
# ^ [[] [] [] []]

# allrubytracks.each do |rubytracksarray|
#   rubytracksarray
# end

##################################### PART 1 ######################################################################
playlists = {}

theurls = JSON.parse( File.read('urls.json') )
theurls1 = theurls[0..706]

theurls1.each do |url|
  puts "in first loop"
  simplifiedtrackobjectarray = []
  arrayofplaylisttrackobjects = rubytracksarray1[url]
  next if arrayofplaylisttrackobjects == nil 
  arrayofplaylisttrackobjects.each do |playlisttrackobject|
    trackobject = playlisttrackobject["track"]
    artists = trackobject["artists"][0]["name"]
    id = trackobject["id"] #spotify ID for the track
    name = trackobject["name"] #name of track
    preview_url = trackobject["preview_url"]
    simplifiedtrackobject = {"artist" => artists, "spotify_id" => id, "name" => name, "preview_url" => preview_url}
    simplifiedtrackobjectarray << simplifiedtrackobject
  end
  playlists[url] = simplifiedtrackobjectarray
  puts "end of first loop"
end 
pretty =  JSON.pretty_generate(playlists)

File.write('simplifiedtracks1.json', pretty)


#################### PART 2 #######################
# playlists = {}

# theurls = JSON.parse( File.read('urls.json') )
# theurls2 = theurls[707..1413]

# theurls2.each do |url|
#   puts "in first loop"
#   simplifiedtrackobjectarray = []
#   arrayofplaylisttrackobjects = rubytracksarray2[url]
#   next if arrayofplaylisttrackobjects == nil 
#   arrayofplaylisttrackobjects.each do |playlisttrackobject|
#     trackobject = playlisttrackobject["track"]
#     artists = trackobject["artists"][0]["name"]
#     id = trackobject["id"] #spotify ID for the track
#     name = trackobject["name"] #name of track
#     preview_url = trackobject["preview_url"]
#     simplifiedtrackobject = {"artist" => artists, "spotify_id" => id, "name" => name, "preview_url" => preview_url}
#     simplifiedtrackobjectarray << simplifiedtrackobject
#   end
#   playlists[url] = simplifiedtrackobjectarray
#   puts "end of first loop"
# end 
# pretty =  JSON.pretty_generate(playlists)

# File.write('simplifiedtracks2.json', pretty)



################ PART 3 ###########################
# playlists = {}

# theurls = JSON.parse( File.read('urls.json') )
# theurls3 = theurls[1414..2120]

# theurls3.each do |url|
#   puts "in first loop"
#   simplifiedtrackobjectarray = []
#   arrayofplaylisttrackobjects = rubytracksarray3[url]
#   next if arrayofplaylisttrackobjects == nil 
#   arrayofplaylisttrackobjects.each do |playlisttrackobject|
#     trackobject = playlisttrackobject["track"]
#     artists = trackobject["artists"][0]["name"]
#     id = trackobject["id"] #spotify ID for the track
#     name = trackobject["name"] #name of track
#     preview_url = trackobject["preview_url"]
#     simplifiedtrackobject = {"artist" => artists, "spotify_id" => id, "name" => name, "preview_url" => preview_url}
#     simplifiedtrackobjectarray << simplifiedtrackobject
#   end
#   playlists[url] = simplifiedtrackobjectarray
#   puts "end of first loop"
# end 

# pretty =  JSON.pretty_generate(playlists)

# File.write('simplifiedtracks3.json', pretty)



########################## PART 4 ###########################
# playlists = {}

# theurls = JSON.parse( File.read('urls.json') )
# theurls4 = theurls[2121..2828]

# theurls4.each do |url|
#   puts "in first loop"
#   simplifiedtrackobjectarray = []
#   arrayofplaylisttrackobjects = rubytracksarray4[url]
#   next if arrayofplaylisttrackobjects == nil 
#   arrayofplaylisttrackobjects.each do |playlisttrackobject|
#     trackobject = playlisttrackobject["track"]
#     next if trackobject == nil 
#     artists = trackobject["artists"][0]["name"]
#     id = trackobject["id"] #spotify ID for the track
#     name = trackobject["name"] #name of track
#     preview_url = trackobject["preview_url"]
#     simplifiedtrackobject = {"artist" => artists, "spotify_id" => id, "name" => name, "preview_url" => preview_url}
#     simplifiedtrackobjectarray << simplifiedtrackobject
#   end
#   playlists[url] = simplifiedtrackobjectarray
#   puts "end of first loop"
# end 

# pretty =  JSON.pretty_generate(playlists)

# File.write('simplifiedtracks4.json', pretty)


# Part 4 **************************************************************************************


require 'json'


alldata = File.read('playlists.json')

rubyuserdata = JSON.parse(alldata)
urlarray = []
urlarrayforeach = []
tracks = {}
playlists = []

arrayofplaylists = rubyuserdata["playlists"]
arrayofplaylists.each do |playlist|
  name = playlist["name"]
  spotify_id = playlist["id"]
  url = playlist["href"]
  playlistobject = {"name" => name, "spotify_id" => spotify_id, "url" => url}
  playlists << playlistobject
end

pretty =  JSON.pretty_generate(playlists)
File.write('playlistspretty.json', pretty)
