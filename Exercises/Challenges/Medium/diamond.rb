class Diamond
  LETTERS = ('A'..'Z').to_a

  def self.make_diamond(letter)
    size = LETTERS.index(letter) + 1

    output = ''

    size.times { |i| output << row(i, size) }
    (size - 2).downto(0) {  |i| output << row(i, size) } if size > 1

    output
  end

  class << self
    private

    def row(index, size)
      letter = LETTERS[index]
      row = if index.zero?
              letter.center(width(size))
            else
              "#{letter}#{' ' * width(index)}#{letter}".center(width(size))
            end
      "#{row}\n"
    end

    def width(index)
      ((index - 1) * 2) + 1
    end
  end
end
