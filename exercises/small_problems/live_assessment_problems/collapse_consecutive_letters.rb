# given a string, return a new string in which all substrings of consecutive identical letters are replaced with a single letter

# algorithm-
#iterate over string, check if current char is equal to previous, if not, append to new string

def collapse(str)
  new_str = ''
  # previous_char = nil
  str.each_char do |char|
    new_str << char unless new_str[-1] == char
  end

  new_str
end

p collapse('aaabbbcccabcd') == 'abcabcd'
