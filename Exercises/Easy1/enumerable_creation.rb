class Tree
  include Enumerable

  def initialize
    @array = [2, 3, 1]
  end

  def each(&block)
    @array.each { |e| block.call(e) }
  end
end

tree = Tree.new

puts tree.max
puts tree.sort.to_s
