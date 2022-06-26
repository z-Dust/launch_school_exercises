def room_area
  puts "Enter length of room in meters:"
  length = gets.chomp.to_i
  puts "Enter width of room in meters:"
  width = gets.chomp.to_i
  puts "The area is #{length*width} meters (#{length*width*10.7639} feet)."
end

SQMETERS_TO_SQFEET = 10.7639
SQFEET_TO_SQINCHES = 10.7639
SQMETERS_TO_SQCENTIMETERS = 10000

def room_area_alt
  puts "Enter length of room in feet:"
  length = gets.chomp.to_f
  puts "Enter width of room in feet:"
  width = gets.chomp.to_f

  square_feet = (length * width).round(2)
  square_meters = (square_feet / SQMETERS_TO_SQFEET).round(2)
  square_inches = (square_feet / SQFEET_TO_SQINCHES).round(2)
  square_centimeters = (square_meters * SQMETERS_TO_SQCENTIMETERS).round(2)

  puts "The area is #{square_meters} meters^2 \n#{square_feet} feet^2 \n#{square_inches} inches^2 \n#{square_centimeters} centimeters^2"
end

room_area_alt
