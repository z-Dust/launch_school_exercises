# def word_sizes(str)
#   h = {}
#   arr = str.split(' ')
#   arr.each do |n|
#     h[n.size] = 0
#   end
#   arr.each do |n|
#     h[n.size] += 1
#   end
#   h
# end

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    counts[word.size] += 1
  end
  counts
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
