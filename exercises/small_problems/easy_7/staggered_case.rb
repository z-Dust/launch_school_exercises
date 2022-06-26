# def staggered_case(str)
#   characters = str.chars.map.with_index do |char, i|
#     if i.even? && char =~ /[a-z]/
#       char.upcase
#     elsif i.odd? && char =~ /[A-Z]/
#       char.downcase
#     else
#       char
#     end
#   end
#   p characters.join
# end

# def staggered_case(str)
#   result = ''
#   need_upper = true
#   str.chars.each do |char|
#     if char =~ /[a-z]/i
#       if need_upper
#         result += char.upcase
#       else
#         result += char.downcase
#       end
#       need_upper = !need_upper
#     else
#       result += char
#     end
#   end
#   p result
# end

# p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# p staggered_case('ALL CAPS') == 'AlL cApS'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('ALL_CAPS') == 'AlL_CaPs'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

a = 'cherry'
b = ["c", "h", "e", "r", "r", "y"]

# puts "a    #{a.object_id}"
# puts "a[0] #{a[0].object_id}"
# puts "a[1] #{a[1].object_id}"
# puts "a    #{a.object_id}"
# puts "a[0] #{a[0].object_id}"
# puts "a[1] #{a[1].object_id}"
# puts "a    #{a.object_id}"
# puts "a[0] #{a[0].object_id}"
# puts "a[1] #{a[1].object_id}"

puts b.object_id
puts b[0].object_id
puts b[0].object_id

b.each do |e|
  e.upcase!
end
puts b
puts b.object_id
puts b[0].object_id
puts b[0].object_id
