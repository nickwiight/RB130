class BeerSong
  def self.verse(num)
    BeerSong.new.song(num, num)
  end

  def self.verses(start, last)
    BeerSong.new.song(start, last)
  end

  def self.lyrics
    BeerSong.new.song(99, 0)
  end

  def song(first, last)
    output = []
    first.downto(last) { |num| output << Verse.new(num).get }
    output.join("\n")
  end
end

class Verse
  attr_reader :num
  
  def initialize(num)
    @num = num
  end

  def get
    next_num = (num - 1) % 100
    output = ''
    output += "#{bottle_count(num, capitalize: true)} of beer on the wall, "
    output += "#{bottle_count(num)} of beer.\n"
    output += take_down
    output += "#{bottle_count(next_num)} of beer on the wall.\n"
    output
  end

  private

  def bottle_count(num, capitalize: false)
    words = capitalize ? 'No more' : 'no more'
    number = num.zero? ? words : num
    bottle = num == 1 ? 'bottle' : 'bottles'
    "#{number} #{bottle}"
  end

  def take_down
    case num
    when 0 then 'Go to the store and buy some more, '
    when 1 then 'Take it down and pass it around, '
    else 'Take one down and pass it around, '
    end
  end
end
