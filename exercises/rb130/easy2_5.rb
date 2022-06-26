def drop_while(arr)
  drop = nil
  arr.each_with_index do |e, i|
    drop = i
    break if !yield(e)
    # if !yield(e)
    #   drop = i
    #   break
    # end
  end
  # return [] if drop == nil
  p arr[drop..-1]
end

# def drop_while(array)
#   index = 0
#   while index < array.size && yield(array[index])
#     index += 1
#   end

#   array[index..-1]
# end

# p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
# p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
# p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
# p drop_while([]) { |value| true } == []
