=begin
  -count up from 1 to input num minus 1
    -test if index is multiple of 3 or 5, if so add index value to sum
=end

# def solution(num)
#   sum = 0
#   1.upto(num - 1) { |i| sum += i if i % 3 == 0 || i % 5 == 0}
#   sum
# end

def solution(num)
  (1..(num - 1)).to_a.select {|i| i % 3 == 0 || i % 5 == 0}.sum
end

p solution(10) == 23
p solution(20) == 78
p solution(200) == 9168
