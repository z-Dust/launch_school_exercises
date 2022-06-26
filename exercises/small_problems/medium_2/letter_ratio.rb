def letter_percentages(str)
  return_hash = {}
  return_hash[:lowercase] = str.chars.count { |char| char.match(/[a-z]/) }
  return_hash[:uppercase] = str.chars.count { |char| char.match(/[A-Z]/) }
  return_hash[:neither] = str.chars.count { |char| char.match(/[^a-zA-Z]/) }

  total_chars = (return_hash[:lowercase] + return_hash[:uppercase] +
                 return_hash[:neither]).to_f

  return_hash[:lowercase] = ((return_hash[:lowercase] / total_chars) * 100).round(1)
  return_hash[:uppercase] = ((return_hash[:uppercase] / total_chars) * 100).round(1)
  return_hash[:neither] = ((return_hash[:neither] / total_chars) * 100).round(1)

  p return_hash
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

p letter_percentages('abcdefGHI') == { lowercase: 66.7, uppercase: 33.3, neither: 0.0 }
