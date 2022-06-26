=begin
  -given a string, return true if it is a pangram, false if not
  -case insentive
  -ignore numbers and punctuation

  -algorithm

  -create array of unique downcased characters from string, dividing on whitespace
  -if array size less than 26 return false, otherwise return true

=end

def panagram?(str)
  return false if str.downcase.gsub(/[( |.|,)]/, '').chars.uniq.size < 26
  true
end

p panagram?("The quick brown fox jumps over the lazy dog.") == true
p panagram?("This is not a pangram.") == false
