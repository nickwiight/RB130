class Element
  attr_accessor :datum, :next

  def initialize(datum, next_value = nil)
    @datum = datum
    @next = next_value
  end

  def tail?
    self.next.nil?
  end

  def ==(other)
    return datum == other.datum if other.is_a?(Element)
    datum == other
  end
end

class SimpleLinkedList
  attr_accessor :list
  
  def initialize
    @list = []
  end

  def size
    list.size
  end

  def empty?
    list.empty?
  end

  def head
    list.last
  end

  def push(value)
    # convert to element if not one already
    element = value.is_a?(Element) ? value : Element.new(value)
    element.next = head
    list.push(element)
  end

  def pop
    list[-2].next = nil if list[-2]&.next
    list.pop
  end

  def peek
    list.last&.datum
  end

  def to_a
    list.reverse.map(&:datum)
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end

  def self.from_a(array)
    new_list = SimpleLinkedList.new
    return new_list if array.nil?

    array.reverse.each do |value|
      new_list.push(value)
    end
    new_list
  end
end
