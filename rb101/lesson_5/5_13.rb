arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

a = arr.sort_by do |sub_arr|
  sub_arr.select do |n|
    n.odd?
  end
end

p a
