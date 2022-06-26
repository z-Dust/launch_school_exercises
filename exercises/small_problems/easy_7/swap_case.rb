def swapcase(str)
  new_arr = str.split('').each do |el|
    if el.match(/[a-z]/)
      p el.upcase!
    elsif el.match(/[A-Z]/)
      p el.downcase!
    end
  end
  new_arr.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
