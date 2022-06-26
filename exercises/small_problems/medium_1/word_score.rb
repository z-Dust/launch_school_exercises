def alphabet_score(str)
  hsh = { a: 1, b:2, c:3, d:4, e:5, f:6,g:7,h:8,i:9, j:10, k:11, l:12, m:13,n:14, o:15, p:16, q:17, r:18,
    s:19, t:20, u:21, v:22, w:23, x:24, y:25, z:26
  }

  hash = {}
  str.split.each do |word|
    hash[word] = 0
    word.each_char do |char|

    hash[word] += hsh[char.to_sym]
    end
  end

  highest = 0
  highest_word = ''
  hash.each do |k, v|
    if v > highest
      highest = v
      highest_word = k
    end
  end
  p highest_word
end

p alphabet_score('man i need a taxi up to ubud') == 'taxi'
p alphabet_score('what time are we climbing up the volcano') == 'volcano'
p alphabet_score('take me to semynak') == 'semynak'
p alphabet_score('aa b') == 'aa'
