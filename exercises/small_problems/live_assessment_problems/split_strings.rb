=begin
  problem-
    -given a string, return an array of strings in which every two characters are paired and form its own array element
    -input: string, output: array of strings

  algorithm-
    -initialize return array
    -iterate over range from 0 to string length minus 1
      check if string length is odd and index is at least char
        if so only append final char and underscore
      otherwise append string to array consisting of two chars
    -return array
=end

def solution(str)
  arr = []
  (0..(str.size - 1)).step(2) do |i|
    if str.size.odd? && i == (str.size - 1)
      arr << str[i] + '_'
    else
      arr << str[i] + str[i + 1]
    end
  end
  arr
end

p solution('abc') == ['ab', 'c_']
p solution('abcdef') == ['ab', 'cd', 'ef']
p solution("abcdef") == ["ab", "cd", "ef"]
p solution("abcdefg") == ["ab", "cd", "ef", "g_"]
p solution("") == []
