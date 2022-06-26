=begin
  -given a hash with integers for keys and values, return the key which is closest to its own value
  -if multiple entries are tired, return the lowest key

    -input: hash, output: integer

  algorithm-
    -subtract key from value and return the key who represents the lowest absolute value
=end

def nexus(hsh)
  hsh.min_by {|k,v| (k-v).abs}[0]
end

p nexus({1 => 3, 3 => 3, 5 => 1}) == 3
p nexus({1 => 10, 2 => 6, 3 => 4, 5 => 1}) == 3
p nexus({1 => 10, 2 => 3, 3 => 4, 5 => 1}) == 2
