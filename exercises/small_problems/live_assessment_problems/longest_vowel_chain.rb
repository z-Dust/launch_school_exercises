def solve(str)
  p arr = str.scan(/[aeiou]*/)
  longest = 0
  arr.each do |e|
    longest = e.size if e.size > longest
  end
  longest
end

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8
