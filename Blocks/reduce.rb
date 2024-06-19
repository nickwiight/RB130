# def reduce(array, default = 0)
#   result = default

#   array.each { |num| result = yield(result, num) }

#   result
# end

def reduce(array, default = nil)
  accumulator = default
  iterate_array = array.dup

  accumulator = iterate_array.shift if accumulator.nil?

  iterate_array.each { |element| accumulator = yield(accumulator, element) }

  accumulator
end

array = [1, 2, 3, 4, 5]

p reduce(array, 0) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
# reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
