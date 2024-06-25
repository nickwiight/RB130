# def each_with_index(array, &block)
#   array.count.times { |i| block.call(array[i], i) }
#   array
# end

# in case using #times is out of scope
def each_with_index(array, &block)
  (0...array.count).each { |i| block.call(array[i], i) }
  array
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
