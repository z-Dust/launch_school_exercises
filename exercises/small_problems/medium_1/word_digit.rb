def word_to_digit(str)
  str.gsub!(/one/, '1')
  str.gsub!(/two/, '2')
  str.gsub!(/three/, '3')
  str.gsub!(/four/, '4')
  str.gsub!(/five/, '5')
  str.gsub!(/six/, '6')
  str.gsub!(/seven/, '7')
  str.gsub!(/eight/, '8')
  str.gsub!(/nine/, '9')
  str.gsub!(/zero/, '0')
  p str
end

# DIGIT_HASH = {
#   'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
#   'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
# }.freeze

# def word_to_digit(words)
#   DIGIT_HASH.keys.each do |word|
#     words.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
#   end
#   words
# end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
