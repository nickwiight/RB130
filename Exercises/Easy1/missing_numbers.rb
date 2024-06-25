# first solution using select
def missing(array)
  # full_array = (array.first..array.last).to_a

  # full_array.select { |num| !array.include?(num) }
  (array.first..array.last).to_a.select { |num| !array.include?(num) }
end

# meh while loop solution
# def missing(array)
#   result = []
#   index = array.first
#   final = array.last

#   while index < final
#     index += 1
#     result << index unless array.include?(index)
#   end

#   result
# end

# good answer gained from comments. #- is super slick
# def missing(array)
#   (array.first..array.last).to_a - array
# end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
