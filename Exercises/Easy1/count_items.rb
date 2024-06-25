# def count(array, &block)
#   count = 0
#   array.each do |element|
#     count += 1 if block&.call(element)
#   end
#   count
# end

# Further Explorations
# def count(array, &block)
#   array.select(&block).count
# end

# Recursion
def count(arr, &block)
  return 0 if arr.count == 0
  block.call(arr[0]) ? count(arr[1..-1], &block) + 1 : count(arr[1..-1], &block)
end

array = [1,2,3,4,5]
count(array, &:odd?)
p array
p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
