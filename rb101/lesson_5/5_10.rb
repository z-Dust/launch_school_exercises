a = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

b = a.map do |hsh|
  incremented_hash = {}
  hsh.each {|k,v| incremented_hash[k] = v + 1}
  incremented_hash
end

p b
