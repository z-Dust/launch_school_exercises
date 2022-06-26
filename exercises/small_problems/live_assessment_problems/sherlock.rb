=begin
  given a hash whose keys are names and valeus are integers, and an array which correspond to integer values of hash, return those
  names from the hash whose hash values represent at least one integer not within the input array

  algorithm-
    -iterate over the hash values
      -iterate over input array
        -if hash value array includes input array values, then add name to output array
    -return output array
=end

pockets = {
  bob: [1],
  tom: [2, 5],
  jane: [7]
}

def find_suspects(hash, arr)
  return_arr = hash.select do |_,v|
    v.any? {|num| !arr.include?(num) }
  end.keys

  return nil if return_arr.empty?
  return_arr
end

p find_suspects(pockets, [1, 2]) == [:tom, :jane]
p find_suspects(pockets, [1, 7, 5, 2]) == nil
p find_suspects(pockets, []) == [:bob, :tom, :jane]
p find_suspects(pockets, [7]) == [:bob, :tom]
