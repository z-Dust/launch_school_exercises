def solve(str)
  arr = []
  start = 0
  loop do
    counter = 0
    loop do
      arr << str[(start..counter)] unless str[start..counter].size == 0
      counter += 1
      break if counter >= str.size
    end
    start += 1
    break if start >= str.size
  end

  odd_count = 0
  arr.each { |e| odd_count += 1 if e.to_i.odd? }

  odd_count
end

p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28
