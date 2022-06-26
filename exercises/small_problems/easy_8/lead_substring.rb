def leading_substrings(str)
  arr = []
  counter = 1
  loop do
    arr << str.slice(0, counter)
    counter += 1
    break if counter > str.size
  end
  arr
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
