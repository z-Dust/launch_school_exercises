=begin
  problem-
    -given a string and an array of strings, return an array of strings consisting of those strings from the array that are
    anagrams of the input string
    -input: string and array of strings, output: array of strings

  algorithm-
    -initialize return array
    -iterate over input array
      compare each alphabetically sorted array element against alphabetically sorted input string
      if match, add current array element to return array
    -return return array
=end

def anagrams(str, arr)
  return_arr = []
  arr.each do |word|
    return_arr << word if word.chars.sort == str.chars.sort
  end
  return_arr
end

p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']
p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) == ['carer', 'racer']
p anagrams('laser', ['lazing', 'lazy',  'lacer']) == []
