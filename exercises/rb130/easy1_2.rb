# def compute
#   return 'Does not compute.' unless block_given?
#   yield
# end

# def compute(block=nil)
#   return 'Does not compute.' unless block_given?
#   yield(block)
# end

# p compute

def compute_with_arg(obj=nil)
  block_given? ? yield(obj) : 'Does not compute'
end

p compute_with_arg
p compute_with_arg('hi') { |n| puts n }
