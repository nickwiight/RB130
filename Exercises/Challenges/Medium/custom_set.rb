class CustomSet
  attr_accessor :list
  
  def initialize(array = [])
    @list = array.uniq
  end

  def empty?
    list.empty?
  end

  def contains?(value)
    list.include?(value)
  end

  def subset?(other)
    list.all?(&other.method(:contains?))
  end

  def disjoint?(other)
    list.none?(&other.method(:contains?))
  end

  def eql?(other)
    list.sort == other.list.sort
  end
  alias == eql?

  def add(value)
    list.push(value) unless contains?(value)
    self
  end

  def intersection(other)
    CustomSet.new(list.select(&other.method(:contains?)))
  end

  def difference(other)
    CustomSet.new(list.reject(&other.method(:contains?)))
  end

  def union(other)
    CustomSet.new(list + other.list)
  end
end
