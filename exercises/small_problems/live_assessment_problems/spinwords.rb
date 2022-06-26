=begin
  - given a string, return the same string, but with all words that haave 5 or more letters reversed
  - strings consist of only letters and spaces

  - input: string, output: string

  - algorithm
    - split string into array
    - iterate over words of the array
      -test size, if greater than 5, reverse
    - join array words into string
    - return string
=end

def spinWords(str)
  str.split(' ').each do |word|
    word.reverse! if word.size > 4
  end.join(' ')
end

p spinWords("Hey fellow warriors") == "Hey wollef sroirraw"
p spinWords("This is a test") == "This is a test"
p spinWords("This is another test") == "This is rehtona test"
p spinWords('test') == 'test'
