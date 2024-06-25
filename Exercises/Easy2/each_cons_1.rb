# def each_cons(array, &block)
#   (array.count - 1).times do |index|
#     block.call(array[index], array[index + 1])
#   end
#   nil
# end

# in case times is out of scope
def each_cons(array, &block)
  array.each_with_index do |item, index|
    break unless index + 1 < array.count
    block.call(item, array[index + 1])
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }
p result.nil?

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result.nil?

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == { 'a' => 'b' }
p result.nil?
