=begin
  -check for prime
    -loop from 2 to n/2
      -check if n has no remainder, if so break, n is not prime

  -sum array values
    -loop, indefinitely, calling check_prime, until prime found
    -return difference
=end

def check_prime(num)
  2.upto(num/2) do |i|
    return false if num % i == 0
  end
  true
end

def minimum_number(arr)
  index = 0
  sum = arr.sum
  loop do
    return index if check_prime(sum + index)
    index += 1
  end
end





p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2
