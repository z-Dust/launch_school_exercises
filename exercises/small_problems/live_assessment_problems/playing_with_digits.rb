=begin
  -given an integer, sum its digit raised to powers determined by p, find a number k such that the number equals k*n
  -if no such numebr exists, return -1
  -input: 2 integers, output: 1 integer

  algorithm-
    -find the integers digits raised to consecutively highers powers beginning with p
      -convert input integer to string
      -map the raised integers to array and sum
    -to find k, divide the sum by n (input integer)
    -return -1 if quotient is not a natural number
=end

def dig_pow(n, p)
  str = n.to_s
  arr = str.chars.map do |char|
    v = char.to_i ** p
    p += 1
    v
  end
  k = arr.sum / n
  return -1 if k < 1
  k
end


p dig_pow(89, 1) == 1 # since 8¹ + 9² = 89 = 89 * 1
p dig_pow(92, 1) == -1 # since there is no k such as 9¹ + 2² equals 92 * k
p dig_pow(695, 2) == 2 # since 6² + 9³ + 5⁴= 1390 = 695 * 2
p dig_pow(46288, 3) == 51 # since 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51
p dig_pow(46288, 3) == 51
