def century(year)
  century = (year / 100.0).ceil.to_s

  ordinal = case century[-1]
  when '1'
    'st'
  when '2'
    'nd'
  when '3'
    'rd'
  else
    'th'
  end
  ordinal = 'th' if century[-2] == '1'

  century + ordinal
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
