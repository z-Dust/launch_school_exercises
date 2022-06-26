=begin
  -given a string, return a string in which the characters are reordered in alphabetical order, case-insensitive and in order of
  -appearance (uppercase/lowercase), whitespace and punctuation removed
    -input: string, output: string

    algorithm-
      -remove punctuation and whitespace from the string
      -
=end

def alphabetized(str)
  str.chars.sort {|a,b| a.downcase <=> b.downcase }.join.strip
end

p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("") == ""
p alphabetized(" ") == ""
p alphabetized(" a") == "a"
p alphabetized("a ") == "a"
p alphabetized(" a ") == "a"
p alphabetized("A b B a") == "AabB"
p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"
