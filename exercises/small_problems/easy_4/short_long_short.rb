def short_long_short(str1, str2)
  long, short = ''
  if str1.size > str2.size
    long = str1
    short = str2
  else
    long = str2
    short = str1
  end
  short + long + short
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
