birds = %w(raven finch hawk eagle)

def meth(arr)
  yield(arr)
end

raptors = ''

# meth(birds) {|birds| *raptors = birds[2..-1]}

meth(birds) {|_, _, *raptors| puts "Raptors: #{raptos.join(', ')}"}

# p raptors
