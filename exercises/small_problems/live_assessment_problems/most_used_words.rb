def top_3_words(str)
  word_arr = str.split
  count_arr = word_arr.map { |word| [word.downcase.gsub(/[^a-z\']/, ''), word_arr.count(word)] }.uniq.sort {|a,b| a[0] <=> b[0]}.sort { |a, b| b[1] <=> a[1] }
  count_arr.flatten.delete_if { |e| e == e.to_i || e == '' || (e =~ /\W/ && !(e =~ /\w/)) }[0..2]
end

p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
p top_3_words("  //wont won't won't ") == ["won't", "wont"]
p top_3_words("  , e   .. ") == ["e"]
p top_3_words("  ...  ") == []
p top_3_words("  '  ") == []
p top_3_words("  '''  ") == []

p top_3_words("""In a village of La Mancha, the name of which I have no desire to call to
 mind, there lived not long since one of those gentlemen that keep a lance
 in the lance-rack, an old buckler, a lean hack, and a greyhound for
 coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]
