# def max_by(array, &block)
#   max = nil
#   index = -1

#   array.each_with_index do |elem, i|
#     result = block.call(elem)

#     if max.nil? || result > max
#       max = result
#       index = i
#     end
#   end

#   array[index]
# end

# This is what I was trying to do before giving up. Maybe time for bed
def max_by(array, &block)
  max = array[0]
  array.each { |item| max = item if block.call(item) > block.call(max) }
  max
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
