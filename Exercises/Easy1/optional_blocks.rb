# def compute
#   block_return = nil

#   block_return = yield if block_given?

# Implicit return you dingus
#   block_return.nil? ? 'Does not compute.' : block_return
# end

# puts compute { 5 + 3 }
# puts compute { 'a' + 'b' }
# puts compute

def compute(arg, &block)
  block_given? ? block.call(arg) : 'Does not compute.'
end

puts compute(3) { |n| n + 5 + 2 }
puts compute('a') { |str| str + 'b' + 'c' }
puts compute(0)
