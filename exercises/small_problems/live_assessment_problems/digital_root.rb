=begin
  -given a natural number, sum its individual digits until only one digit remains
  -input: integer, output: integer

  algorithm-
    -converting integer to a string
    -initialize a sum variable
    -loop over the string, converting each char to an integer and summing
    -break if sum is greater than 9
    -return sum
=end

# def digital_root(num)
#   str = num.to_s
#   sum = 0
#   loop do
#     str.each_char do |char|
#       sum += char.to_i
#     end
#     break if sum < 10
#     str = sum.to_s
#     sum = 0
#   end
#   sum
# end

def digital_root(num)
  return num if num < 10
  str = num.to_s
  arr = str.chars.map {|char| char.to_i}
  digital_root(arr.sum)
end

p digital_root(16)
p digital_root(942)
p digital_root(132189)
p digital_root(493193)
p digital_root(456)
