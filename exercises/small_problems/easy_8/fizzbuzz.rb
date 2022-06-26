# def fizzbuzz(start, finish)
#   start.upto(finish) do |n|
#     if n % 3 == 0 && n % 5 == 0
#       puts 'FizzBuzz'
#     elsif n % 3 == 0
#       puts 'Fizz'
#     elsif n % 5 == 0
#       puts 'Buzz'
#     else
#       puts n
#     end
#   end
# end

def fizzbuzz(start, finish)
  (start..finish).each do |n|
    if n % 3 == 0 && n % 5 == 0
      puts 'FizzBuzz'
    elsif n % 3 == 0
      puts 'Fizz'
    elsif n % 5 == 0
      puts 'Buzz'
    else
      puts n
    end
  end
end

fizzbuzz(1, 15)
