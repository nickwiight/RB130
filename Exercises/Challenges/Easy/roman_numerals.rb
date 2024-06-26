class RomanNumeral
  attr_reader :number

  LETTERS = {
    1 => 'I',
    5 => 'V',
    10 => 'X',
    50 => 'L',
    100 => 'C',
    500 => 'D',
    1000 => 'M'
  }

  # s - single, h - half, t - ten
  # CONVERSION = {
  #   1 => 's',
  #   2 => 'ss',
  #   3 => 'sss',
  #   4 => 'sh',
  #   5 => 'h',
  #   6 => 'hs',
  #   7 => 'hss',
  #   8 => 'hsss',
  #   9 => 'st'
  # }

  # brute forcy, but I'm okay with that
  CONVERSION = {
    1 => %w(I X C M),
    2 => %w(II XX CC MM),
    3 => %w(III XXX CCC MMM),
    4 => %w(IV XL CD),
    5 => %w(V L D),
    6 => %w(VI LX DC),
    7 => %w(VII LXX DCC),
    8 => %w(VIII LXXX DCCC),
    9 => %w(IX XC CM),
    0 => ''
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    converted_array = number.digits.map.with_index do |digit, index|
      CONVERSION[digit][index]
    end

    converted_array.reverse.join
  end

  # first attempt
  # def digit_conversion(digit, power)
  #   return '' if digit == 0
  #   single = LETTERS[power]
  #   half = LETTERS[5 * power]
  #   ten = LETTERS[10 * power]

  #   if power == 1000
  #     CONVERSION[digit].gsub('s', single)
  #   else
  #     CONVERSION[digit].gsub('s', single).gsub('h', half).gsub('t', ten)
  #   end
  # end
end
