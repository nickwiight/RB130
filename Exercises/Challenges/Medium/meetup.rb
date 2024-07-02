class Meetup
  attr_reader :year, :month

  RANGES = {
    first: (1..7),
    second: (8..14),
    third: (15..21),
    fourth: (22..28),
    fifth: (29..31),
    last: (22..31),
    teenth: (13..19)
  }

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, descriptor)
    possible_dates = []
    RANGES[descriptor.downcase.to_sym].each do |day|
      next unless Date.valid_date?(year, month, day)

      day = Date.new(year, month, day)
      possible_dates << day if day.send(weekday.downcase.concat('?'))
    end
    possible_dates.last
  end
end
