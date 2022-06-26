=begin
  -given 2 integers, determine if there if a signle digit repeats three times in a row in the first integer and if that same
  -integer occurs twice in a row in the second integer, if so return that integer, if not return 0

  -input: 2 integers, output: integer

  algorithm-
    -convert both integers to strings
    -iterate over boths strings, initialize an empty string, while iterating assign empty string to current char,
    -when moving to next compare that to current char, if they match three times in a row, and twice for the second string,
    -return that number
    -return 0 otherwise
=end

def triple_double(num1, num2)
  digit1 = ''
  str = num1.to_s
  str.each_char.with_index do |char, i|
    digit1 = char if char == str[i+1] && char == str[i+2]
  end

  digit2 = ''
  str = num2.to_s
  if !digit1.empty?
    str.each_char.with_index do |char, i|
      digit2 = char if char == str[i+1]
    end
  end
  return 1 if digit1 == digit2 && !digit1.empty? && !digit2.empty?
  0
end

p triple_double(12345, 12345) == 0
p triple_double(666789, 12345667) == 1
