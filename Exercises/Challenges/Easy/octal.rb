class Octal
  attr_reader :octal
  
  def initialize(octal)
    @octal = octal
  end

  def to_decimal
    string = valid? ? octal : '0'

    string.to_i.digits.map.with_index { |num, i| num * (8**i) }.sum
  end

  private

  def valid?
    octal.gsub(/[^0-7]/, '') == octal
  end
end
