def nth_char(word_arr)
  new_string =''

  word_arr.each.with_index do |word, i|
    new_string << word[i]
  end

  new_string
end

p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) ==  'Codewars'
