class Clock
  attr_reader :abs_time

  WHOLE_DAY = 1440
  ONE_HOUR = 60

  def initialize(hour, min)
    @abs_time = hour * ONE_HOUR + min
  end

  def hour(time=abs_time)
    time / ONE_HOUR
  end

  def min(time=abs_time)
    time % ONE_HOUR
  end

  def self.at(hour, min=0)
    new(hour, min)
  end

  def to_s
    "%02d:%02d" % [hour, min]
  end

  def +(min)
    new_time = abs_time + min
    new_time -= WHOLE_DAY while new_time > WHOLE_DAY
    Clock.new(hour(new_time), min(new_time))
  end

  def -(min)
    new_time = abs_time - min
    new_time += WHOLE_DAY while new_time < 0
    Clock.new(hour(new_time), min(new_time))
  end

  def ==(other_time)
    abs_time == other_time.abs_time
  end
end
