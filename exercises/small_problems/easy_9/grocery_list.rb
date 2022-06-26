def buy_fruit(arr)
  new_arr = []
  arr.each do |fruit, number|
    number.times {new_arr << fruit}
  end
  new_arr
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
