=begin
  -convert input number to string
  -construct an array with every possible number that can be formed from deleting one digit
    -convert strings to array of chars, then join after deleting one char each
  -return the highest
=end

def delete_digit(num)
  str = num.to_s
  arr = []
  str.size.times do |i|
    new_str = str.chars
    new_str.delete_at(i)
    arr << new_str.join.to_i
  end
  arr.max
end

p delete_digit(152) == 52
p delete_digit(1001) == 101
p delete_digit(10) == 1
