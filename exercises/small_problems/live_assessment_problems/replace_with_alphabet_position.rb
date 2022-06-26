=begin
  -given a string, return a string with each letter replaced by its position in the alphabet

  algorithm-
    -initialize an alphabet array
    -remove all whitespace and punctuation
    -iterate over array of chars, from which we return an array of integers, via map and alphabet array
    -join array and return
=end

ALPHA = ('a'..'z').to_a

def alphabet_position(str)
  str.downcase.gsub(/[( |\-|.|')]/, '').chars.map do |char|
    ALPHA.index(char) + 1
  end.join(' ')
end

p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
p alphabet_position("-.-'") == ""
