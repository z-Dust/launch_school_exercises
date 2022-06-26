=begin
  -given two arrays, remove all occurences of the values that are present in the second array from the first
  -input: 2 arrays, output: 1 array

  algorithm-
    -iterate over the second array
      -check the first array fore presence of current element
        -if present, delete from first array
=end

def array_diff(arr1, arr2)
  arr2.each do |e|
    arr1.delete(e)
  end
  arr1
end

p array_diff([1,2], [1]) == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([], [1,2]) == []
