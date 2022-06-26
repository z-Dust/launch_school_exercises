=begin
  problem-
  -given a string, find its longest substring tht is in alphabetical order

  -input: string, output: string

  algorithm-
  -initialize array
  -initialize empty string
  -iterate through characters of string with index
    -on first iteration append first letter to string
    -if current char is greater than or equal to previous, append it to string
    -if not, append string to array and set string to current letter
  -append final string to array
  -return the string from the array with greatest length
=end

def longest(str)
  arr = []
  return_str = ''
  str.chars.each_with_index do |letter, i|
    if i == 0
      return_str << str[0]
    elsif str[i] >= str[i - 1]
      return_str << letter
    else
      arr << return_str
      return_str = letter
    end
  end
  arr << return_str
  arr.max_by {|e| e.size}
end

p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') =='fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'
