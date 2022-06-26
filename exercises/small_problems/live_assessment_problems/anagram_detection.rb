=begin
  -input: string, output: string

  algorithm-
    -convert each string to arrays, sort arrays, compare arrays to each other, if they match they are anagrams
=end

def is_anagram(str1, str2)
  str1.downcase.chars.sort == str2.downcase.chars.sort
end

p is_anagram('Creative', 'Reactive') == true
p is_anagram("foefet", "toffee") == true
p is_anagram("Buckethead", "DeathCubeK") == true
p is_anagram("Twoo", "WooT") == true
p is_anagram("dumble", "bumble") == false
p is_anagram("ound", "round") == false
p is_anagram("apple", "pale") == false
