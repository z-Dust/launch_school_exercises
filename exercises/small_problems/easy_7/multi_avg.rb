# def show_multiplicative_average(arr)
#   multiplication = 1
#   arr.each { |int| multiplication *= int }
#   result = multiplication / arr.size.to_f
#   puts "The result is #{format('%.3f', result)}"
# end

# def show_multiplicative_average(arr)
#   result = arr.inject(:*)
#   final_result = result / arr.size.to_f
#   puts "The result is #{format('%.3f', final_result)}"
# end

def show_multiplicative_average(arr)
  puts "The result is #{format('%.3f', arr.inject(:*) / arr.size.to_f)}"
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
