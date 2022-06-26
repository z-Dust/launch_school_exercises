class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(arr)
    r_arr = []
    arr.each do |words|
      next if words.downcase == @word
      r_arr << words if words.downcase.chars.sort == @word.chars.sort
    end
    r_arr
  end
end
