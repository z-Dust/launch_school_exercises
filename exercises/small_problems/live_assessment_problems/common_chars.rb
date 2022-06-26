# given an array of strings, return an array of letters present in all strings, including duplicates
# input- array of strings, output- array of letters

# iterate over the letters of the first string, store the number of times each letter is present in each string within a count_array,
# one letter at a time, then insert that letter into the return array a number of times equal to the
# minimum value within the count array, which corresponds to the numebr of that letter is present within each string

def common_chars(str_arr)
  return_arr = []
  return return_arr if str_arr.empty?
  str_arr[0].each_char do |char|
    local_arr = []
    if !return_arr.include?(char)
      str_arr.each { |word| local_arr << word.count(char) }
      local_arr.min.times { return_arr << char }
    end
  end
  return_arr
end

p common_chars(['bella', 'label', 'roller']) == ['e', 'l', 'l']
p common_chars(['cool', 'lock', 'cook']) == ['c', 'o']
p common_chars(['hello', 'goodbye', 'booya', 'random']) == ['o']
p common_chars(['aabbaaaa', 'ccdddddd', 'eeffee', 'ggrrrrr', 'yyyzzz']) == []
p common_chars([]) == []
p common_chars(['cat']) == ['c', 'a', 't']
