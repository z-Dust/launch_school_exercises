def step(start, stop, step)
  counter = start
  loop do
    yield(counter)
    break if counter >= stop
    counter += step
  end
  counter
end

step(1, 10, 3) { |value| puts "value = #{value}" }
