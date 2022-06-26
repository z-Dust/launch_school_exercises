# given an array of string, return the longest common prefix among all strings
# if none exists, return an empty string

# store the length of the sortest string
# outer loop, iterate a number of times equal to shortest string,
#   counter += 1
#     inner slice each string, length equal to counter, store into another aarray
#   compare bew array elements for equality, if all equal break
# return prefix

def common_prefix(str_arr)
  shortest = str_arr.min_by { |str| str.length }.length
  return_str = ''
  shortest.times do |i|
    new_arr = []
    str_arr.each { |str| new_arr << str.slice(0, (i + 1)) }
    return_str = new_arr[0] if new_arr.all? { |str| str == new_arr[0] }
  end
  return_str
end

p common_prefix(['flower', 'flow', 'flight']) == 'fl'
p common_prefix(['dog', 'racecar', 'car']) == ''
p common_prefix(['interspecies', 'interstellar', 'interstate']) == 'inters'
p common_prefix(['throne', 'dungeon']) == ''
p common_prefix(['throne', 'throne']) == 'throne'
