def step(start, final, step, &block)
  index = start

  until index > final
    block.call(index)
    index += step
  end
end

step(1, 10, 3) { |value| puts "value = #{value}" }
