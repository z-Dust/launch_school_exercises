# given an array, find a conriguous sequence within that array whose sum is greatest
# input - array, output - integer (sum)
# note: lowest output should be zero, also should be zero for empty array

# capture all possible subarrays, store greatest sum

def max_sequence(arr)
  # return 0 if arr.empty?
  final_sum = 0
  arr.each_index do |outer_i|
    outer_i.upto(arr.size - 1) do |inner_i|
      sum = arr[outer_i..inner_i].reduce(:+)
      final_sum = sum if sum > final_sum
    end
  end
  final_sum
end

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
