# def sequence(num)
#   num_arr = []
#   1.upto(num) { |n| num_arr << n }
#   p num_arr
# end

def sequence(num)
  return (1..num).to_a if num > 0
  num_arr = []
  new_num = num * -1
  1.upto(new_num) { |n| num_arr << (n * -1) }
  num_arr
end

# p sequence(5) == [1, 2, 3, 4, 5]
# p sequence(3) == [1, 2, 3]
# p sequence(1) == [1]

p sequence(-5) == [-1, -2, -3, -4, -5]
p sequence(-3) == [-1, -2, -3]
p sequence(-1) == [-1]
p sequence(0) == []
