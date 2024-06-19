def select(array)
  # count = 0
  result = []

  # while count < array.length
  #   value = array[count]
  #   result << value if yield(value)
  #   count += 1
  # end
  array.each { |element| result << element if yield(element) }

  result
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true
