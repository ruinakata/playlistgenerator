# 1. Loop through all? playlists and find the user's 10-20 songs 
# 2. First find candidate playlists
# 3. playlist = A , user = B
# 4. num user B has but user A doesnt == numsongs - both(1) 
# 5. num user A has but user B doesn't == 0
# 6. 


require 'json'
# LOOP THRU RUN JACCARD INDEX #####################################################################

########################### SEARCH WITH ARTIST NAME ###########################################
 jaccardlist = {}
 arrayofusersongnames = Track.where(playlist_id: 71).map {|track| track.artist} #compare playlist1 to everyhting else
playlist_id = 1
while playlist_id < 2000 
  playlisttracks = Track.where(playlist_id: playlist_id)
  arrayofplaylistsongnames = playlisttracks.map {|track| track.artist}
  intersect = arrayofusersongnames & arrayofplaylistsongnames
  union = arrayofusersongnames | arrayofplaylistsongnames
  jaccard = intersect.length.to_f / union.length.to_f
  print "The jaccard index for playlist #{playlist_id} is #{jaccard}"
  if jaccard > 0.03
    jaccardlist[playlist_id] = jaccard
  end
  playlist_id += 1 
end
  p jaccardlist
end

arrayofarrays = jaccardlist.sort_by{|k,v| v}.reverse
#[[71, 1.0], [1229, 0.25925925925925924], [1135, 0.25], [1233, 0.23333333333333334], [1236, 0.2222222222222222]]



# JACCARD INDEX #####################################################################################
# all playlists have key of url and values as arrays of objects

# jscores = {}

# #loop through each playlist and get the MAB, MA, MB, and M00
# playlisturlarray1.each do |playlisturl|
#   mAB = 0
#   mA = 0
#   mB = 0
#   m00 = 0
#   j = 0
#   #loop thru A
#     arrayoftracks = playlists[playlisturl] #look at one playlist
#     exampleusersongs.each do |song| #loop through each song in the list that the user gave [0,1,2]
#       arrayoftracks.each do |track| #look at one track in the playlist [2,3,4]
#         if song["name"] == track["name"] # 0 and 2, 0 and 3, 0 and 4
#           mAB += 1
#         else 
#           mA += 1
#         end
#       end
#     end
#   #loop thru B
#     arrayoftracks = playlists[playlisturl] #look at one playlist
#     arrayoftracks.each do |track| #look at one track in the playlist [2,3,4]
#       exampleusersongs.each do |song| #loop through each song in the list that the user gave [0,1,2]
#         if song["name"] == track["name"] 
#           #don't do anything because we already did
#         else 
#           mB += 1
#         end
#       end
#     end
#   j = mAB / (mA + mB)
#   jscores[playlisturl => j]
# end


# print "The j scores are "
# p jscores




###################################################








