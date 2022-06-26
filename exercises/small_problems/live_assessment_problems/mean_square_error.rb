=begin
  problem-
    -given two arrays of integers of equal length, find the average of the squares of the absolute value differences between
    -corresponding memebers between both arrays
    -input: two arrays of integers, output: integer

  algorithm-
    -
    -iterate over first array with index with map
      -sum current element value with corresponding element in second array
      -if sum is negative multiply by -1
      -square sum
    -sum values of map array and divide by size
=end

def solution(arr1, arr2)
  arr = arr1.map.with_index do |e, i|
    difference = e - arr2[i]
    difference *= -1 if difference < 0
    difference * difference
  end
  arr.reduce(:+) / arr.size.to_f
end

p solution([1, 2, 3], [4, 5, 6]) == 9
p solution([10, 20, 10, 2], [10, 25, 5, -2]) == 16.5
p solution([-1, 0], [0, -1]) == 1
