def count_occurrences(arr)
  hash = {}
  arr.each do |element|
    count = 0
    # next if hash.has_key?(element)
    arr.each { |n| count += 1 if n == element }
    hash[element] = count
  end
  hash.each do |k, v|
    puts "#{k} => #{v}"
  end
end

def count_occurrences_alt(arr)
  hash = {}
  arr.each do |element|
    count = 0
    arr.each { |n| count += 1 if n.downcase == element.downcase }
    hash[element.downcase] = count
  end
  hash.each do |k, v|
    puts "#{k} => #{v}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', "suv"
]

count_occurrences_alt(vehicles)
