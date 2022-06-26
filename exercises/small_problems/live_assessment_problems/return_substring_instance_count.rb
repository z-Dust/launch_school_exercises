def solution(str, search)
  str.scan(/#{search}/).size
end

p solution('aa_bb_cc_dd_bb_e', 'bb')
p solution('aaabbbcccc', 'bbb')

p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1
