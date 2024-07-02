class Series
  attr_reader :string
  
  def initialize(string)
    @string = string
  end

  def slices(size)
    raise ArgumentError if size > string.length

    output = []
    (string.length - (size - 1)).times do |index|
      output << string[index, size].chars.map(&:to_i)
    end
    output
    # Launch School's more elegant solution
    # string.chars.map(&:to_i).each_cons(size).to_a
  end
end
