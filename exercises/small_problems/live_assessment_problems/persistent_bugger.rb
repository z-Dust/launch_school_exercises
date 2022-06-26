=begin
  - given a number, return the number of times its digits must be multiplied until a single digit is reached

  - input: integer, output: integer

  - algorithm
    - initialize count variable to zero
    - loop
      - break if num to string length is == 1
      - initialize product variable to one
      - convert num to string then to array
      - iterate through array, convert each string element to integer and multiply by product
      - set num equal to product
      - increment count
    - return count

=end

def persistence(num)
  count = 0
  loop do
    break if num.to_s.size == 1
    product = 1
    num.to_s.each_char { |char| product *= char.to_i }
    num = product
    count += 1
  end
  count
end

p persistence(39) == 3
p persistence(4) == 0
p persistence(25) == 2
p persistence(999) == 4
