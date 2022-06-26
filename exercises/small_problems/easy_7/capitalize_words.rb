# def word_cap(str)
#   arr = str.split
#   arr.each do |e|
#     e.capitalize!
#   end
#   arr.join(' ')
# end

# def word_cap(words)
#   words.split.map(&:capitalize).join(' ')
# end

# def word_cap(words)
#   words_array = words.split.map do |word|
#     word.downcase!
#     word[0] = word[0].upcase
#     word
#   end
#   p words_array.join(' ')
# end

def word_cap(words)
  arr = []
  words.downcase.split.each do |word|
    word[0] = word[0].upcase
    arr << word
  end
  arr.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
