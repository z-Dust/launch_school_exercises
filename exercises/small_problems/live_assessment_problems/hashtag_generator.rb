=begin
  problem-
    -given a string, return a string with each word capitalized, whitespace removed, and it must start with a hashtag and if the
    -input string is empty or if the output string is empty or greater than 140 characters, return false

    input: string, output: string or boolean

  algorithm-
    -return false if string is greater than 140 length or string is empty
    -split string on white space, into array
    -iterate over string array, capitalize each word
    -join array into string, prepend hashtag
    -return string is les than 1400 characters and if not empty, otherwise return false
=end

def generateHashtag(str)
  return false if str.strip.empty?
  # arr = str.split.map { |word| word.capitalize }
  # return_str = arr.join.prepend('#')
  return_str = str.split.map { |word| word.capitalize }.join.prepend('#')
  return return_str unless return_str.size > 140 || return_str.empty?
  false
end

p generateHashtag("") == false
p generateHashtag(" " * 200) == false
p generateHashtag("Do We have A Hashtag") == "#DoWeHaveAHashtag"
p generateHashtag("Codewars") == "#Codewars"
p generateHashtag("Codewars Is Nice") ==  "#CodewarsIsNice"
p generateHashtag("Codewars is nice") == "#CodewarsIsNice"
p generateHashtag("code" + " " * 140 + "wars") == "#CodeWars"
p generateHashtag("Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat") == false
p generateHashtag("a" * 139) == "#A" + "a" * 138
p generateHashtag("a" * 140) == false
