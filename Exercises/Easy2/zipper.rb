# def zip(arr1, arr2)
#   result = []
#   arr1.count.times do |index|
#     result << [arr1[index], arr2[index]]
#   end
#   result
# end

# someone else's supremely elegant solution
def zip(arr1, arr2)
  (0...arr1.count).map { |i| [arr1[i], arr2[i]] }
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
