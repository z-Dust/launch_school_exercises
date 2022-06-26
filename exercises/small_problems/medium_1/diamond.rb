# def diamond(num)
#   star = '*'
#   stars = 1
#   0.upto(num - 1) do |i|
#     if ((num / 2) - i) < 0
#       offset = i - (num / 2)
#     else
#       offset = (num / 2) - i
#     end

#     puts " " * offset + star * stars

#     if i >= (num / 2)
#       stars -= 2
#     else
#       stars += 2
#     end
#   end
# end

def diamond(num)
  stars = 1
  0.upto(num - 1) do |i|
    if ((num / 2) - i) < 0
      offset = i - (num / 2)
    else
      offset = (num / 2) - i
    end

    if i > 0 && i != num - 1
      star_row = '*' + (" " * (stars - 2)) + '*'
    else
      star_row = '*'
    end

    puts " " * offset + star_row

    if i >= (num / 2)
      stars -= 2
    else
      stars += 2
    end
  end
end


diamond(9)
