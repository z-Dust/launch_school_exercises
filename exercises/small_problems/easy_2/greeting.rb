def greeting_one
  puts "what is your name?"
  name = gets.chomp
  if name[-1] == '!'
    name = name.chop
    puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
  else
    puts "Hello #{name}."
  end
end

def greeting_two
  puts "what is your name?"
  name = gets
  name.chomp!
  if name[-1] == '!'
    name.chop!
    puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
  else
    puts "Hello #{name}."
  end
end

greeting_two
