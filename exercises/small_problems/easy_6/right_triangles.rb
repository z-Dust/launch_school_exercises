# def triangle(length)
#   stars = 0
#   loop do
#     stars += 1
#     space = length - stars
#     string = ' ' * space + '*' * stars
#     puts string
#     break if stars == length
#   end
# end

def triangle(length)
  stars = 0
  loop do
    stars += 1
    space = length - stars
    string = ' ' * space + '*' * stars
    puts string
    break if stars == length
  end
end

triangle(9)
