# given 2 strings, determine if a common substring of length 2 or greater exists between them
# return true if found, or false otehrwise

# input: two strings, output: boolean

# note: 1) case insensitive. 2) empty string is not equal to an empty string

# algorithm-
# find which string is shortest
# create an array composed of all substrings of shortest string
# loop- compare each possible substring of other strings against all strings of substring array
#     return true if a common substrings exists, false otherwise

# def substring_test(str1, str2)
#   substring_arr1 = []
#   str1.each_char.with_index do |_, i|
#     (i..str1.size).to_a.size.times do |length|
#       substring_arr1 << str1.slice(i, length).downcase if length > 1
#     end
#   end

#   substring_arr2 = []
#   str2.each_char.with_index do |_, i|
#     (i..str2.size).to_a.size.times do |length|
#       substring_arr2 << str2.slice(i, length).downcase if length > 1
#     end
#   end

#   substring_arr1.each do |substring1|
#     substring_arr2.each do |substring2|
#       return true if substring1 == substring2
#     end
#   end
#   false
# end

def substring_test(str1, str2)
  if str1.size > str2.size
    shortest = str2
    longest = str1
  else
    shortest = str1
    longest = str2
  end

  substring_arr = []

  (shortest.size - 1).times do |i|
    substring_arr << shortest.slice(i, 2).downcase
  end

  substring_arr.each do |substring|
    return true if longest.downcase.include?(substring)
  end

  false
end


p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true
