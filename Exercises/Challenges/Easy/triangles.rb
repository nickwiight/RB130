class Triangle
  attr_reader :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError unless valid?
  end

  def kind
    uniq_sides = sides.map(&:to_f).uniq.count
    %w(equilateral isosceles scalene)[uniq_sides - 1]
  end

  private

  def valid?
    sides.min > 0 && !size_iniquality?(sides)
  end

  # damn this is over engineered
  def size_iniquality?(sides)
    sums = sides.map.with_index do |_, index|
      sides.select.with_index { |_, i| i != index }.sum
    end

    sums.zip(sides).map { |elem| !elem.reduce(&:>) }.any?
  end
end
