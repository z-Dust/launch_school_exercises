def swap(str)
  arr = str.split
  arr.each do |n|
    first = n[0]
    last = n[-1]
    n[0] = last
    n[-1] = first
  end
  arr.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
