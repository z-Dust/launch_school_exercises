DIGITS = [ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(int)
  str = ''
  num = int
  loop do
    str.prepend(DIGITS[num.remainder(10)])
    num = num / 10
    break if num == 0
  end
  str
end

def signed_integer_to_string(int)
  case
  when int > 0 then return integer_to_string(int).prepend('+')
  when int < 0
    int *= -1
    return integer_to_string(int).prepend('-')
  else '0'
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
