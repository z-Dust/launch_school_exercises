# def swap_name(str)
#   arr = str.split
#   "#{arr[1]}, #{arr[0]}"
# end

def swap_name(name)
  name.split.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
