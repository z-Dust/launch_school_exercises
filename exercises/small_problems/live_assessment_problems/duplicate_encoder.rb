=begin
  -convert string to array of chars
  -iterate over array of chars and return new array with each char transformed based on criteria
=end

def duplicate_encode(str)
  str.downcase.chars.map {|char| str.count(char) == 1 ? '(' : ')'}.join
end

p duplicate_encode("din") == "((("
p duplicate_encode("recede") == "()()()"
p duplicate_encode("Success") == ")())())"
p duplicate_encode("(( @") == "))(("
