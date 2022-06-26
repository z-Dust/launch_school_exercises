=begin
  problem-
    -given two integers, raise the first by the power of the second, and return it
    -input: two integer, output: integer

  algorithm-
    -initialize product variable to 1
    -multiply first integer by itself a number of equal to second integer minus 1
=end

def power(base, exponent)
  return nil if exponent < 0
  product = 1
  exponent.times { product *= base }
  product
end

p power(2, 3) == 8
p power(10, 0) == 1
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(10, 0) == 1
p power(2, 3) == 8
p power(3, 2) == 9
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(8, -2) == nil
