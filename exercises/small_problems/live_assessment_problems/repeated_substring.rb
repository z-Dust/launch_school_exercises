# def f(str)
# counter = 0
# str_size = str.size
#   loop do
#     counter += 1
#     return [str[0, counter], str_size / counter] if str[0, counter] == str[counter, counter] && counter * 2 == str_size
#     return [str, 1] if counter > str_size / 2 # exit if test substring is greater than half length of string
#     next if str_size % counter != 0 # if substring size does not divide evenly into string then skip

#     match = true # assume true and flag false upon mismatch below
#     if str[0, counter] == str[counter, counter]
#       inner_counter = counter
#       loop do
#         inner_counter += counter # increment index value by size of current substring to compaare next substring
#         if str[0, counter] != str[inner_counter, counter] # if substrings do not match
#           match = false
#           break
#         end
#         break if inner_counter + counter >= str_size #break after reaching end of string
#       end
#       return [str[0, counter], str_size / counter] if match # if match not flagged false then it means successful match
#     end
#   end
# end

def f(str)
  counter = 0
  loop do
    counter += 1
    if str.size % counter != 0
      return [str, 1] if counter > (str.size / 2)
      next
    else
      return [str[0, counter], str.size / counter] if str[0, counter] * (str.size / counter) == str
    end
  end
end

p f('aa') == ['a', 2]
p f('abab') == ['ab', 2]
p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]
p f('abcabcabc') == ['abc', 3]
p f('abcdabc') == ['abcdabc', 1]
p f('aaaaaaa') == ['a', 7]
p f('aba') == ['aba', 1]
p f('abaababaab') == ['abaab', 2]
