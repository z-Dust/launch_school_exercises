def digit_list(num)
  digit_arr = []
  recur = num
  loop do
    digit_arr << recur.remainder(10)
    recur = recur / 10
    break if recur == 0
  end
  digit_arr.reverse
end

def digit_list_alt(num)
  digit_arr = num.to_s.split("")
  digit_arr.map { |char| char.to_i}
end

p digit_list_alt 37281790
