=begin
  -given an integer array, find the index for which all elements to the left of it and all elements to the right both sum to the
  -same value. return -1 if no such index exists, if mutliple such indexes exists, return the first one
  -inputL array, output: integer

  algorithm-
    -iterate over array with index
     -use index to slice array and sum values
     -compares values, if they match then return current index value

=end

require 'pry'

def find_even_index(arr)
  arr.each_index do |i|
    left = arr.select.with_index { |_, inner_i| inner_i < i }.sum
    right = arr.select.with_index { |_, inner_i| inner_i > i }.sum
    binding.pry
    return i if left == right
  end
  -1
end

p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1
