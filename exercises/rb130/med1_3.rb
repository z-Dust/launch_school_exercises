items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   puts "#{items.join(', ')}"
#   puts "Nice selection of food we have gathered!"
# end

# def gather(items)
#   puts "Let's start gathering food."
#   items.each {|item| yield(item)}
#   puts "Nice selection of food we have gathered!"
# end

# gather(items) {|item| puts item}

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) { |produce| puts produce.join('; ') }
