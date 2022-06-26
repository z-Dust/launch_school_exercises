DIGITS = [ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(int)
  str = ''
  num = int
  loop do
    str.prepend(DIGITS[num % 10])
    num = num / 10
    break if num == 0
  end
  str
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
