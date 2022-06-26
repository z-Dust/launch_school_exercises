class Meetup
  ORDINAL = {
    'first' => 0, 'second' => 1, "third" => 2, "fourth" => 3, "fifth" => 4,
    'last' => -1, 'teenth' => 0
  }

  def initialize(year, month)
    @year = year
    @month = month
    @last_day = Date.civil(year, month, -1).day
  end

  def day(weekday, ord)
    weekday = weekday.downcase + "?"
    # ord.downcase!
    [*Date.new(@year, @month, 1)..Date.new(@year, @month, -1)].select do |days|
      if ord == 'teenth'
        (13..19).include?(days.day) && days.send(weekday)
      else
        days.send(weekday)
      end
    end[ORDINAL[ord.downcase]]
  end
end
