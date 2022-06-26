=begin
  -construct array of words, iterate though array of words
    -then iterate through each char of each word
      -test each char for case, and switch it
  -reverse  the order of elements of new array
  -join array and return
=end

def transformer(str)
  str.split.map do |word|
    word.chars.map do |char|
      if char == char.downcase
        char.upcase
      else
        char.downcase
      end
    end.join
  end.reverse.join(' ')
end

p transformer("Example Input") == "iNPUT eXAMPLE"
