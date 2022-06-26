# def anagram(arr)

#   arr.each do |word|
#     new_arr = []
#     word_arr = word.split('').sort
#     arr.each do |inner_word|
#       inner_word_arr = inner_word.split('').sort
#       if word_arr == inner_word_arr
#         new_arr << inner_word unless word == inner_word
#       end
#     end
#     p new_arr
#   end

# end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

# anagram(words)

result = {}

words.each do |word|
  key = word.split('').sort.join
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each_value do |v|
  puts "------"
  p v
end
