# def penultimate(str)
#   str_arr = str.split
#   str_arr[-2]
# end

# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'

def middle(str)
  return 'NOT A STRING' unless str.is_a? String
  str_arr = str.split
  middle = str_arr[(str_arr.size/2.to_f).ceil - 1]
  return middle unless middle == nil
  'EMPTY STRING'
end

p middle('hey what the fuck')
p middle('hey what the fucking fuck')
p middle('')
p middle('one')
p middle(5)
