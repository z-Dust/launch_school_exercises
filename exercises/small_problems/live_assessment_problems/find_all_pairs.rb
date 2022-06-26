def pairs(arr)
  new_arr = []
  total_count = 0
  arr.each do |e|
    if arr.count(e) > 1 && !new_arr.include?(e)
      total_count += arr.count(e) / 2
      new_arr << e
    end
  end
  total_count
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0
