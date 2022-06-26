=begin
- given an array of strings (single letters representing cardinal directions), determine if directions will end in same location as start
- and there are 10 directions, if so return true, otherwise return false

- input: array of single letter strings, output: boolean

- algorithm
  - return false is array size does not equal 10
  - initialize 2  and y coordinate variables
  - iterate through input array, incrementing or decrementing coordinates correspnding with directions
  - return false if both coordinates are not zero
  - return true
=end

def is_valid_walk(directions_arr)
  return false if directions_arr.size != 10
  x, y = 0, 0

  directions_arr.each do |direction|
    case direction
    when 'n' then x += 1
    when 's' then x -= 1
    when 'e' then y += 1
    when 'w' then y -= 1
    end
  end

  return false if x != 0 || y != 0
  true
end


p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
p is_valid_walk(['w']) == false
p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false
