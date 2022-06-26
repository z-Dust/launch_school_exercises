def leading_substrings(str, start)
  arr = []
  counter = 1
  loop do
    arr << str.slice(start, counter)
    counter += 1
    break if counter > str.size - start
  end
  arr
end

def substrings(str)
  new_arr = []
  start = 0
  loop do
    new_arr << leading_substrings(str, start)
    start += 1
    break if start >= str.size
  end
  p new_arr.flatten
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
