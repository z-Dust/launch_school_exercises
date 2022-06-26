=begin
  -given a 2d array, determine the nested index value of integer 1, of which there is one present, all other elements being integer 0
  -input 2d array, output: array

  -algorithm
    -iterate over the array until we encounter a subarray that includes integer value 1, store index value
    -then we determine its index value within the subarray, store index value
    -return arrey with stored index values
=end

def mineLocation(arr)
  return_arr = []
  arr.each do |subarr|
    return_arr << arr.index(subarr) << subarr.index(1) if subarr.include?(1)
  end
  return_arr
end

p mineLocation( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0]
p mineLocation( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1]
p mineLocation( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) == [2, 1]
p mineLocation([ [1, 0], [0, 0] ]) == [0, 0]
p mineLocation([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]) == [0, 0]
p mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ]) == [2, 2]
