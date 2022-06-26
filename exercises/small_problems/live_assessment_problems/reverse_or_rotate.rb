=begin
  -given a string of digit and an integer n, construct substrings  of length n. if the sum of the cubes of the digits of a
  -substring is divible by 2, reverse that substring, otherwise rotate it to the left by one position.
  -if n is zero or if string is empty or if n is greater then string length return empty string

  -input: string and integer, output: string

  algorithm-
  -test for edge cases
    -iterating over string a number of times equal to difference between string length and sz plus 1
    -aquire each substring, test and manipulate as required
      -map the substring onto and array converting string digits into integers
        -cube each integer and sum
    return string

    correct algorithm-
    -test edge cases and return empty string if true
      -grab substrings equal to input integer, ignore last chunk if less  than input integer
        -iterate a number of times over string equal to string length divided by substring size

      -test if sum of cubes of digits is even
        -manipulate appropriately
      -return string


=end
# def revrot(str, sz)
#   return '' if str.empty? || sz == 0 || sz > str.size
#   (str.size - sz + 1).times do |i|
#     if str[i, sz].chars.map {|char| char.to_i}.inject(0) {|sum, n| sum + n**3}.even?
#       # p "#{i} if"
#       str[i, sz] = str[i, sz].reverse
#     else
#       # p "#{i} else"
#       str[i, sz] = str[i+1, sz - 1].chars.push(str[i]).join
#     end
#   end
#   p str
# end

def revrot(str, sz)
  return_str = ''
  return '' if str.empty? || sz == 0 || sz > str.size
  (str.size / sz).times do |i|
    if str.slice(i*sz, sz).chars.map {|chr| chr.to_i}.inject(0) {|sum,n| sum + n**3}.even?
      return_str << str.slice(i*sz, sz).reverse
    else
      arr = str.slice(i*sz, sz).chars
      return_str << arr.push(arr.shift).join
    end
  end
  return_str
end

p revrot("1234", 0) == ""
p revrot("", 0) == ""
p revrot("1234", 5) == ""
p revrot("733049910872815764", 5) == "330479108928157"
p revrot("123456987654", 6) == "234561876549"
p revrot("123456987653", 6) == "234561356789"
p revrot("66443875", 4) == "44668753"
p revrot("66443875", 8) == "64438756"
p revrot("664438769", 8) == "67834466"
p revrot("123456779", 8) == "23456771"
p revrot("", 8) == ""
p revrot("123456779", 0) == ""
p revrot("563000655734469485", 4) == "0365065073456944"
