=begin 2: 07

# Given a string as input, find the longest substring that does not have any consecutive repeating characters.

input: string, output: String

==============BAD APPROACH+++++++++
algorithm-
  -initialize array
  -iterate over input String
    -initialize empty string
    -check if current char is repeat of last
      -if not, append to string
      -if it is, append string to array, set string to empty string

    -append the final string to array
    -return the longest string from the array
    ===================++++++++++++++++++++++

  algorithm-
    -grab every possible substring, add to array
        -outer loop
          -inner loop, inner index
            -from current outer loop index, slice each possible length string and add to array (inner index)

    -test if substrings have any repeating characters, if they do not add to new array
      -interate through each string coming each letter against the next, if any match, do not add to new array

    -return longest substring from array

=end

def find_longest_substring(str)
  arr = []
  str.each_char.with_index do |_, i|
    (str.size - i).times do |length|
      arr << str.slice(i, length + 1)
    end
    # i.upto(str.size - 1) do |end_index|
    #   arr << str.slice(i..end_index)
    # end
  end

  new_arr = []
  arr.each do |substring|
    (substring.size - 1).times do |i|
      break if substring[i] == substring[i + 1]
      new_arr << substring if i == substring.size - 2
    end
  end
  return str[0] if new_arr.empty?
  new_arr.max_by { |substring| substring.size }
end



p find_longest_substring('aaaa') == 'a'
p find_longest_substring('aaaazzz') == 'az'
p find_longest_substring('bookkeeper') == "eper"
p find_longest_substring('leetucebox') == "etucebox"
