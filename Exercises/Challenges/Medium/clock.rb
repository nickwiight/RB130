class Clock
  HOUR = 60
  DAY = 24

  def initialize(hour, minute)
    wrap_hour, @minute = minute.divmod(HOUR)
    @hour = wrap(hour + wrap_hour)
  end

  def self.at(hour, minute = 0)
    new(hour, minute)
  end

  def ==(other)
    hour == other.hour && minute == other.minute
  end

  def +(min)
    wrap_hour, new_minute = (minute + min).divmod(HOUR)
    Clock.new(wrap(hour + wrap_hour), new_minute)
  end

  def -(min)
    wrap_hour, new_minutes = (minute - min).divmod(HOUR)
    Clock.new(wrap(hour + wrap_hour), new_minutes)
  end

  def to_s
    format('%02d:%02d', hour, minute)
  end

  protected
 
  attr_accessor :hour, :minute

  private

  def wrap(hour)
    if hour < 0
      hour += DAY while hour < 0
    else
      hour -= DAY while hour >= DAY
    end
    hour
  end
end
