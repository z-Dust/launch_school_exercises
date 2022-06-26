=begin
  -given two arrays, determine if all elementts the second array are the values of the first array squared,
  -regardless of order

  -input: 2 arrays, output: boolean

  algorithm-
   -sort both arrays
   -construct a new array of subarrays, with each element of each subarray being corresponding elements from both arrays
   -iterate over the new array and compare the elements of each subarray
      -if one is not the square of the other, return false
    -return true if all tests are passed
=end

def comp(arr1, arr2)
  return false if arr1 == nil || arr2 == nil || arr1.empty? || arr2.empty? || arr1.size != arr2.size
  arr = arr1.sort.zip(arr2.sort)
  arr.each do |sqrt, sqr|
    return false if sqr != sqrt**2
  end
  true
end

p comp([121, 144, 19, 161, 19, 144, 19, 11], [121, 14641, 20736, 361, 25921, 361, 20736, 361]) == true
p comp([121, 144, 19, 161, 19, 144, 19, 11] , [132, 14641, 20736, 361, 25921, 361, 20736, 361]) == false
p comp(nil, [1, 2, 3]) == false
p comp([1, 2], []) == false
p comp([1, 2], [1, 4, 4]) == false
