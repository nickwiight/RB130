class Scrabble
  attr_reader :word, :scores

  def initialize(word)
    @word = word || ''
    @scores = {}
  end

  def score
    word.downcase.chars.map { |char| value(char) }.sum
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  private

  def value(char)
    case char
    when /[aeioulnrst]/ then 1
    when /[dg]/ then 2
    when /[bcmp]/ then 3
    when /[fhvwy]/ then 4
    when /[k]/ then 5
    when /[jx]/ then 8
    when /[qz]/ then 10
    else 0
    end
  end
end
