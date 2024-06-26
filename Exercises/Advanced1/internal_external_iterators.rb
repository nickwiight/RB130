factorial = Enumerator.new do |yielder|
  accumulator = 0
  number = 0
  loop do
    accumulator = number == 0 ? 1 : accumulator * number
    yielder << accumulator
    number += 1
  end
end

6.times { |i| puts "#{i}! = #{factorial.next}" }
puts '----------------'
6.times { |i| puts "#{i}! = #{factorial.next}" }
factorial.rewind
puts '----------------'
6.times { |i| puts "#{i}! = #{factorial.next}" }
