

simp1 = JSON.parse(File.read('simplifiedtracks1.json'))
simp2 = JSON.parse(File.read('simplifiedtracks2.json'))
simp3 = JSON.parse(File.read('simplifiedtracks3.json'))
simp4 = JSON.parse(File.read('simplifiedtracks4.json'))

arrayofurls1 = simp1.keys
arrayofurls2 = simp2.keys
arrayofurls3 = simp3.keys
arrayofurls4 = simp4.keys

index = 0
playlistid = index + 1 #1
#loop thru playlists
while index < arrayofurls1.length
  url = arrayofurls1[index]
  arrayoftracks = simp1[url]
  #loop thru tracks in playlist
  arrayoftracks.each do |track|
    track[:playlist_id] = playlistid
    Track.create(track)
  end
  index += 1
  playlistid += 1
end


index = 0
playlistid = arrayofurls1.length + 1 #701
while index < arrayofurls2.length
  url = arrayofurls2[index]
  arrayoftracks = simp2[url]
  arrayoftracks.each do |track|
    track[:playlist_id] = playlistid
    Track.create(track)
  end
  index += 1
  playlistid += 1
end


index = 0
playlistid = arrayofurls1.length + arrayofurls2.length + 1 
while index < arrayofurls3.length
  url = arrayofurls3[index]
  arrayoftracks = simp3[url]
  arrayoftracks.each do |track|
    track[:playlist_id] = playlistid
    Track.create(track)
  end
  index += 1
  playlistid += 1
end


index = 0
playlistid = arrayofurls1.length + arrayofurls2.length + arrayofurls3.length + 1 
while index < arrayofurls4.length
  url = arrayofurls4[index]
  arrayoftracks = simp4[url]
  arrayoftracks.each do |track|
    track[:playlist_id] = playlistid
    Track.create(track)
  end
  index += 1
  playlistid += 1
end
