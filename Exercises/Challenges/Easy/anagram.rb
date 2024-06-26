class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def match(array)
    array.select { |word| anagram?(word) }
  end

  private

  def anagram?(test)
    return false if word.downcase == test.downcase
    word.downcase.chars.tally == test.downcase.chars.tally
  end
end
