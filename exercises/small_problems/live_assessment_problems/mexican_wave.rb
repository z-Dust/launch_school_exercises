=begin
  given a string, return an array of length equal to length of the input string, where wach element of the array is the input string
  but with each consecutive element having the next consecutive letter upcased with all others downcased

  algorithm-
    -iniitialize an array containing specified number of elements of the input string
    -iterate over array
      -
=end

def wave(str)
  arr = Array.new(str.size, str)
  arr.map.with_index do |word, i|
    new_word = word.chars
    new_word[i].upcase!
    new_word.join
  end.select { |word| word != word.downcase }
end

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]
