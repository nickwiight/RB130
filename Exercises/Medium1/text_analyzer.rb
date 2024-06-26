class TextAnalyzer
  def initialize(text)
    @text = text
  end

  def process(&block)
    puts block.call(@text)
  end
end

analyzer = TextAnalyzer.new(File.read('sample_text.txt'))
analyzer.process { |text| "#{text.split("\n\n").count} paragraphs" }
analyzer.process { |text| "#{text.split("\n").count} lines" }
analyzer.process { |text| "#{text.split.count} words" }
