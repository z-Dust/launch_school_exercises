items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# gather(items) do | *fruit1, fruit2|
#   puts fruit1.join(', ')
#   puts fruit2
# end

# gather(items) do | fruit1, *fruit2, fruit3|
#   puts fruit1
#   puts fruit2.join(', ')
#   puts fruit3
# end

# gather(items) do | fruit1, *fruit2|
#   puts fruit1
#   puts fruit2.join(', ')
# end

gather(items) do |apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end
