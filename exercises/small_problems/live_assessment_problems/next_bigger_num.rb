# given a positive integer, return the next largest integer that can be formed from its individual digits
# if no such number can be formed, return -1

# input: integer, output: integer

# convert num into strings, construct an array of all possible combinations of digits, then sort, then return next element up
# from argument

# initialize array
# loop
#   insert into array a swap version of string
#     until string equals original array
#
# sort and return next element
#---------------------------------------------------------------------
# def permutations(n)
#   return 1 if n == 1
#   permutations(n - 1)
# end

# def next_bigger_num(num)
#   arr = []
#   str = num.to_s
#   return -1 if str.size == 1
#   counter = 0
#   loop_counter = 0
#   n_permutations = permutations(str.size)
#   p n_permutations
#   loop do
#     loop_counter += 1
#     str[counter], str[counter + 1] = str[counter + 1], str[counter]
#     arr << str.dup
#     # break if str == num.to_s
#     break if loop_counter == n_permutations

#     counter += 1
#     counter = 0 if counter + 1 == str.size
#   end
#   # p arr.index(num.to_s)
#   # p num
#   # p arr
#   arr.sort!
#   p arr
#   return arr[(arr.index(num.to_s) + 1)].to_i unless num == arr.last
#   -1
# end
#----------------------------------------------------------------------
def permutations(n, arr)
  return 1 if n == 1
  new_arr = []

  arr.each do |e|
    for a in 0..(n-1) do
      str = e.dup
      str[-n], str[(-n+a)] = str[(-n+a)], str[-n]
      new_arr << str
    end
  end

  arr.replace(new_arr)
  permutations(n - 1, arr)
end

def next_bigger_num(num)
  str = num.to_s
  return -1 if str.size == 1

  arr = []
  arr << str
  permutations(str.size, arr)

  arr.sort!.uniq!
  return arr[(arr.index(str) + 1)].to_i unless str == arr.last
  -1
end
#----------------------------------------------------------------------


p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(20170) == 20701
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798
p next_bigger_num(112) == 121
