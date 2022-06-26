# def multisum(num)
#   sum = 0
#   1.upto(num) { |n| sum += n if n % 3 == 0 || n % 5 == 0 }
#   sum
# end

def multisum(num)
  (1..num).inject(0) { |sum, n| (n % 3 == 0 || n % 5 == 0) ? sum + n : sum }
end


p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
