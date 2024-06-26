def types(array, &block)
  block.call(array)
end

birds = %w(raven finch hawk eagle)
types(birds) { |_, _, *raptors| puts "Raptors: #{raptors.join(', ')}" }
