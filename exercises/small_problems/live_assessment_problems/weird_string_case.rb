=begin
  -given a string, return same string with all indedxed letters upcased
  -input: string, output: string

  algorith-
    -iterate over the string, and upcase all even index letters
=end

def weirdcase(str)
  str.chars.map.with_index do |char, i|
    if i.even?
      char.upcase
    else
      char
    end
  end.join
end


p weirdcase( "String" ) == "StRiNg"
p weirdcase( "Weird string case" ) == "WeIrD StRiNg cAsE"
