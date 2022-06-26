=begin
  -given 2 strings, determine if a substring longer thn 2 letters appears in both strings, case insensitive
  -input: 2 strings, output: boolean

  algorithm-
    -constructing 2 arrays, each with all possible substrings of length 2 or more from both strings
    -iterate over one of the arrays, determine of that substring exists within the other array
      -if so, return true, otherwise return false

=end

def s(str1, str2)
  arr1 = []
  arr2 = []

  str1.chars.each_index do |i|
    str1.chars.each_index do |idx|
      arr1 << str1[i..idx].downcase unless str1[i..idx].size < 2
    end
  end

  str2.chars.each_index do |i|
    str2.chars.each_index do |idx|
      arr2 << str2[i..idx].downcase unless str2[i..idx].size < 2
    end
  end

  arr1.each do |sub|
    return true if arr2.include?(sub)
  end
  false
end

p s('Something', 'Fun') == false
p s('Something', 'Home') == true
p s('Something', '') == false
p s('', 'Something') == false
p s('BANANA', 'banana') == true
p s('test', 'lllt') == false
p s('', '') == false
p s('1234567', '541265') == true
p s('supercalifragilisticexpilidocious', 'SoundOfItIsAtrociou') == true
