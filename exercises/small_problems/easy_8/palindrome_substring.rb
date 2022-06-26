def is_palindrome?(string)
  str = string.gsub(/[^0-9a-z]/i, '').downcase
  str == str.reverse && str.size > 1
end

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
  new_arr.flatten
end

def palindromes(str)
  arr = substrings(str)
  arr.select { |string| is_palindrome?(string) }
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
