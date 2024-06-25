def map(array, &block)
  array.each_with_object([]) { |item, object| object << block.call(item) }
end

def map!(array, &block)
  array.count.times { |i| array[i] = block.call(array[i]) }
  array
end

array = [1, 3, 6]
p map!(array) { |value| value**2 } == [1, 9, 36]
p array
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
