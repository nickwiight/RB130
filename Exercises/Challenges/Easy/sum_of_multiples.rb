class SumOfMultiples
  attr_reader :multiples

  def initialize(*multiples)
    @multiples = multiples
  end

  def to(num)
    (1...num).select { |n| any_multiple?(n) }.sum
  end

  def self.to(num)
    SumOfMultiples.new(3, 5).to(num)
  end

  private

  def any_multiple?(number)
    multiples.any? { |multiple| (number % multiple).zero? }
  end
end
