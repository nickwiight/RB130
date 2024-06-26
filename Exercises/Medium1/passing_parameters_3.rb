items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*array, wheat|
  puts array.join(', ')
  puts wheat
end

puts '--------------'

gather(items) do |apples, *array, wheat|
  puts apples
  puts array.join(', ')
  puts wheat
end

puts '--------------'

gather(items) do |apples, *array|
  puts apples
  puts array.join(', ')
end

puts '--------------'

gather(items) do |apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end
