=begin

- given a string, return the "orginial" string with all 'WUB' substrings removed, with spaces between words

- input: string, output: string

- algorithm
  -replace all instances of 'WUB' substring with whitespace
  -collapse multple whitespce into single occurence
  -return string

=end

def song_decoder(str)
  str.gsub('WUB', ' ').squeeze(' ').strip
end

p song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB") == "WE ARE THE CHAMPIONS MY FRIEND"
p song_decoder("AWUBBWUBC") == "A B C"
p song_decoder("AWUBWUBWUBBWUBWUBWUBC") == "A B C"
p song_decoder("WUBAWUBBWUBCWUB") == "A B C"
